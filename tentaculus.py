from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException, ElementNotInteractableException
from time import sleep
from csv import writer, reader
from selenium.webdriver.firefox.options import Options

option = Options()
option.headless = True

# Firefox
driver = webdriver.Firefox(executable_path="/home/climz/PycharmProjects/D&D_parser/geckodriver", options=option)
# Chrome
# driver = webdriver.Chrome(executable_path="/home/climz/PycharmProjects/D&D_parser/chromedriver", options=option)

with open("another_data/armor.csv", "r") as a:
    csv_reader = reader(a)
    armor_data = list(csv_reader)

with open("another_data/tool.csv", "r") as a:
    csv_reader = reader(a)
    tool_data = list(csv_reader)


def currency_convert(money):
    if "cp" in money:  # Copper(Медь)
        money = int(money[:money.find(" ")])
        return money
    elif "sp" in money:  # Silver(Серебро)
        money = int(money[:money.find(" ")])
        return money * 10
    elif "ep" in money:  # Electrum(Электрум)
        money = int(money[:money.find(" ")])
        return money * 50
    elif "gp" in money:  # Gold(Золото)
        money = int(money[:money.find(" ")])
        return money * 100
    elif "pp" in money:  # Platinum(Платина)
        money = int(money[:money.find(" ")])
        return money * 1000
    else:  # Ничего
        print("NO_CURRENCY")
        money = 0
        return money


equipment_name_list = ["armor.csv", "weapon.csv", "ammunition.csv", "consumables.csv", "kit.csv",
                       "tool.csv", "gear.csv", "container.csv", "arcane_focus.csv", "druidic_focus.csv",
                       "holly_simbol.csv", "clothes.csv", "camp.csv"]

enl_len = len(equipment_name_list)


def csv_writer(it, count_i, equal):
    with open("parsed_data/ALLItems.csv", "a", encoding="utf-8") as f:
        write = writer(f)
        write.writerow(it)
        if equal and count_i == 5:  # Для соединения двух файлов(tool)
            for name in tool_data:
                write.writerow(name)
            write.writerow("/")
        elif equal:
            write.writerow("/")
    if count_i < enl_len:
        with open("parsed_data/" + equipment_name_list[count_i], "a", encoding="utf-8") as k:
            write = writer(k)
            write.writerow(it)
            if equal and count_i == 5:  # Для соединения двух файлов(tool)
                for name in tool_data:
                    write.writerow(name)


def get_cards():
    cards = driver.find_elements(By.CLASS_NAME, "cardContainer")
    return cards


def go_to_url():
    driver.get("https://tentaculus.ru/equipment/index.html")
    driver.find_element(By.ID, "showAllItems").click()


def get_info():
    go_to_url()
    buttons_down = driver.find_elements(By.CLASS_NAME, "combo_box_arrow")
    buttons_down[0].click()
    labels = driver.find_elements(By.TAG_NAME, "label")
    count_labels = len(labels)
    items = []
    for i in range(0, count_labels):
        try:
            labels[i].click()
        except ElementNotInteractableException:
            break
        sleep(1)
        web = get_cards()
        count_web = len(web)
        for j in range(0, count_web):
            # TRY
            equality = j == count_web - 1
            s = str(web[j].find_element(By.CLASS_NAME, "header_info").text)
            slice_name_type = s.find("\n")
            if i == 0:  # armor
                armor_name = s[:slice_name_type]
                armor_type = s[slice_name_type + 1:-1]
                armor_type = armor_type[armor_type.find("(") + 1:]
                armor_price = web[j].find_element(By.CLASS_NAME, "coast").text
                armor_price = currency_convert(armor_price)
                armor_class = web[j].find_element(By.CLASS_NAME, "ac").text
                armor_weight = str(web[j].find_element(By.CLASS_NAME, "weight").text)
                if armor_weight == "":
                    armor_weight = 0
                else:
                    armor_weight = int(armor_weight[armor_weight.find(" ") + 1:-5])

                items.append(armor_type.capitalize())
                items.append(armor_name.capitalize())
                items.append(armor_price)
                items.append(armor_weight)
                items.append(armor_class)
                items.append(armor_data[j][0])  # Сила
                items.append(armor_data[j][1])  # Скрытность
                items.append(armor_data[j][2])  # Надевание
                items.append(armor_data[j][3])  # Снятие

                csv_writer(items, i, equality)

            elif i == 1:  # weapon
                weapon_name = s[:slice_name_type]
                weapon_name = weapon_name.replace(", ", " ")
                weapon_type = s[slice_name_type + 1:-1]
                weapon_type = weapon_type[weapon_type.find("(") + 1:]
                weapon_price = web[j].find_element(By.CLASS_NAME, "coast").text
                weapon_price = currency_convert(weapon_price)
                if str(weapon_price).isdigit():
                    weapon_price = int(weapon_price)
                try:
                    weapon_damage = web[j].find_element(By.CLASS_NAME, "damage").text
                except NoSuchElementException:
                    weapon_damage = ""
                try:
                    weapon_weight = str(web[j].find_element(By.CLASS_NAME, "weight").text)
                except NoSuchElementException:
                    weapon_weight = ""
                try:
                    weapon_properties = web[j].find_element(By.CLASS_NAME, "props").text
                    weapon_properties = weapon_properties.replace(", ", " ")
                except NoSuchElementException:
                    weapon_properties = None
                weapon_weight = weapon_weight[weapon_weight.find(" ") + 1:-5]
                if weapon_weight.isdigit():
                    weapon_weight = int(weapon_weight)
                elif "/" in weapon_weight:
                    weapon_weight = float(weapon_weight[0]) / float(weapon_weight[2])
                else:
                    weapon_weight = 0

                items.append(weapon_type.capitalize())
                items.append(weapon_name.capitalize())
                items.append(weapon_price)
                items.append(weapon_weight)
                items.append(weapon_damage)
                items.append(weapon_properties)

                csv_writer(items, i, equality)

            elif i == 2:  # ammunition
                ammunition_name = s[:slice_name_type]
                ammunition_type = s[slice_name_type + 1:]
                ammunition_price = str(web[j].find_element(By.CLASS_NAME, "coast").text)
                ammunition_price = currency_convert(ammunition_price)
                ammunition_weight = str(web[j].find_element(By.CLASS_NAME, "weight").text)
                if ammunition_weight == "":
                    ammunition_weight = 0
                else:
                    ammunition_weight = ammunition_weight[ammunition_weight.find(" ") + 1:-5]

                items.append(ammunition_type.capitalize())
                items.append(ammunition_name.capitalize())
                items.append(ammunition_price)
                items.append(ammunition_weight)

                csv_writer(items, i, equality)

            elif i == 3:  # consumables
                consumables_name = s[:slice_name_type]
                consumables_name = consumables_name.replace(", ", " ")
                consumables_type = s[slice_name_type + 1:]
                consumables_price = web[j].find_element(By.CLASS_NAME, "coast").text
                consumables_price = currency_convert(consumables_price)
                try:
                    consumables_weight = str(web[j].find_element(By.CLASS_NAME, "weight").text)
                    consumables_weight = consumables_weight[consumables_weight.find(" ") + 1:-5]
                except NoSuchElementException:
                    consumables_weight = ""
                if consumables_weight.isdigit():
                    consumables_weight = int(consumables_weight)
                elif "/" in consumables_weight:
                    consumables_weight = float(consumables_weight[0]) / float(consumables_weight[2])
                else:
                    consumables_weight = 0

                items.append(consumables_type.capitalize())
                items.append(consumables_name.capitalize())
                items.append(consumables_price)
                items.append(consumables_weight)

                csv_writer(items, i, equality)

            elif i == 4:  # kit
                kit_name = s[:slice_name_type]
                kit_type = s[slice_name_type + 1:]
                kit_price = str(web[j].find_element(By.CLASS_NAME, "coast").text)
                kit_price = currency_convert(kit_price)
                kit_weight = str(web[j].find_element(By.CLASS_NAME, "weight").text)
                if kit_weight == "":
                    kit_weight = 0
                else:
                    kit_weight = kit_weight[kit_weight.find(" ") + 1:-5]

                items.append(kit_type.capitalize())
                items.append(kit_name.capitalize())
                items.append(kit_price)
                items.append(kit_weight)

                csv_writer(items, i, equality)

            elif i == 5:  # tool
                tool_name = s[:slice_name_type]
                tool_name = tool_name.replace(", ", " ")
                tool_type = s[slice_name_type + 1:]
                tool_price = str(web[j].find_element(By.CLASS_NAME, "coast").text)
                tool_price = currency_convert(tool_price)
                tool_weight = str(web[j].find_element(By.CLASS_NAME, "weight").text)
                if tool_weight == "":
                    tool_weight = 0
                else:
                    tool_weight = tool_weight[tool_weight.find(" ") + 1:-5]

                items.append(tool_type.capitalize())
                items.append(tool_name.capitalize())
                items.append(tool_price)
                items.append(tool_weight)

                csv_writer(items, i, equality)

            elif i == 6:  # gear
                gear_name = s[:slice_name_type]
                gear_name = gear_name.replace(", ", " ")
                gear_type = s[slice_name_type + 1:]
                gear_price = str(web[j].find_element(By.CLASS_NAME, "coast").text)
                gear_price = currency_convert(gear_price)
                gear_weight = str(web[j].find_element(By.CLASS_NAME, "weight").text)
                gear_weight = gear_weight[gear_weight.find(" ") + 1:-5]
                if gear_weight.isdigit():
                    gear_weight = int(gear_weight)
                elif "/" in gear_weight:
                    gear_weight = float(gear_weight[0]) / float(gear_weight[2])
                else:
                    gear_weight = 0

                items.append(gear_type.capitalize())
                items.append(gear_name.capitalize())
                items.append(gear_price)
                items.append(gear_weight)

                csv_writer(items, i, equality)

            elif i == 7:  # container
                container_name = s[:slice_name_type]
                container_name = container_name.replace(", ", " ")
                container_type = s[slice_name_type + 1:]
                container_price = str(web[j].find_element(By.CLASS_NAME, "coast").text)
                container_price = currency_convert(container_price)
                container_weight = str(web[j].find_element(By.CLASS_NAME, "weight").text)
                container_weight = container_weight[container_weight.find(" ") + 1:-5]
                if container_weight.isdigit():
                    container_weight = int(container_weight)
                else:
                    container_weight = 0

                items.append(container_type.capitalize())
                items.append(container_name.capitalize())
                items.append(container_price)
                items.append(container_weight)

                csv_writer(items, i, equality)

            elif i == 8:  # arcane focus
                arcane_focus_name = s[:slice_name_type]
                arcane_focus_name = arcane_focus_name.replace(", ", " ")
                arcane_focus_type = s[slice_name_type + 1:]
                arcane_focus_price = str(web[j].find_element(By.CLASS_NAME, "coast").text)
                arcane_focus_price = currency_convert(arcane_focus_price)
                arcane_focus_weight = str(web[j].find_element(By.CLASS_NAME, "weight").text)
                arcane_focus_weight = arcane_focus_weight[arcane_focus_weight.find(" ") + 1:-5]
                if arcane_focus_weight.isdigit():
                    arcane_focus_weight = int(arcane_focus_weight)
                elif "/" in arcane_focus_weight:
                    arcane_focus_weight = float(arcane_focus_weight[0]) / float(arcane_focus_weight[2])
                else:
                    arcane_focus_weight = 0

                items.append(arcane_focus_type.capitalize())
                items.append(arcane_focus_name.capitalize())
                items.append(arcane_focus_price)
                items.append(arcane_focus_weight)

                csv_writer(items, i, equality)

            elif i == 9:  # druidic focus
                druidic_focus_name = s[:slice_name_type]
                druidic_focus_name = druidic_focus_name.replace(", ", " ")
                druidic_focus_type = s[slice_name_type + 1:]
                druidic_focus_price = str(web[j].find_element(By.CLASS_NAME, "coast").text)
                druidic_focus_price = currency_convert(druidic_focus_price)
                druidic_focus_weight = str(web[j].find_element(By.CLASS_NAME, "weight").text)
                druidic_focus_weight = druidic_focus_weight[druidic_focus_weight.find(" ") + 1:-5]
                if druidic_focus_weight.isdigit():
                    druidic_focus_weight = int(druidic_focus_weight)
                else:
                    druidic_focus_weight = 0

                items.append(druidic_focus_type.capitalize())
                items.append(druidic_focus_name.capitalize())
                items.append(druidic_focus_price)
                items.append(druidic_focus_weight)

                csv_writer(items, i, equality)

            elif i == 10:  # holly simbol
                holly_symbol_name = s[:slice_name_type]
                holly_symbol_name = holly_symbol_name.replace(", ", " ")
                holly_symbol_type = s[slice_name_type + 1:]
                holly_symbol_price = str(web[j].find_element(By.CLASS_NAME, "coast").text)
                holly_symbol_price = currency_convert(holly_symbol_price)
                holly_symbol_weight = str(web[j].find_element(By.CLASS_NAME, "weight").text)
                holly_symbol_weight = holly_symbol_weight[holly_symbol_weight.find(" ") + 1:-5]
                if holly_symbol_weight.isdigit():
                    holly_symbol_weight = int(holly_symbol_weight)
                else:
                    holly_symbol_weight = 0

                items.append(holly_symbol_type.capitalize())
                items.append(holly_symbol_name.capitalize())
                items.append(holly_symbol_price)
                items.append(holly_symbol_weight)

                csv_writer(items, i, equality)

            elif i == 11:  # clothes

                clothes_name = s[:slice_name_type]
                clothes_name = clothes_name.replace(", ", " ")
                clothes_type = s[slice_name_type + 1:]
                clothes_price = str(web[j].find_element(By.CLASS_NAME, "coast").text)
                clothes_price = currency_convert(clothes_price)
                clothes_weight = str(web[j].find_element(By.CLASS_NAME, "weight").text)
                clothes_weight = clothes_weight[clothes_weight.find(" ") + 1:-5]
                if clothes_weight.isdigit():
                    clothes_weight = int(clothes_weight)
                else:
                    clothes_weight = 0

                items.append(clothes_type.capitalize())
                items.append(clothes_name.capitalize())
                items.append(clothes_price)
                items.append(clothes_weight)

                csv_writer(items, i, equality)

            elif i == 12:  # camp
                camp_name = s[:slice_name_type]
                camp_name = camp_name.replace(", ", " ")
                camp_type = s[slice_name_type + 1:]
                camp_price = str(web[j].find_element(By.CLASS_NAME, "coast").text)
                camp_price = currency_convert(camp_price)
                camp_weight = str(web[j].find_element(By.CLASS_NAME, "weight").text)
                camp_weight = camp_weight[camp_weight.find(" ") + 1:-5]
                if camp_weight.isdigit():
                    camp_weight = int(camp_weight)
                else:
                    camp_weight = 0

                items.append(camp_type.capitalize())
                items.append(camp_name.capitalize())
                items.append(camp_price)
                items.append(camp_weight)

                csv_writer(items, i, equality)
            else:
                print("Parse complete")
                break

            print(items)
            items.clear()

        labels[i].click()
    driver.close()
