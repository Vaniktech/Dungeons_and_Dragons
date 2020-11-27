from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException, ElementNotInteractableException
from time import sleep
from csv import writer
from os import path, rmdir, mkdir
import shutil

driver = webdriver.Chrome(executable_path="C:/chromedriver.exe")


def currency_convert(money):
    if "cp" in money:
        money = int(money[:money.find(" ")])
        return money
    elif "sp" in money:
        money = int(money[:money.find(" ")])
        return money * 10
    elif "ep" in money:
        money = int(money[:money.find(" ")])
        return money * 50
    elif "gp" in money:
        money = int(money[:money.find(" ")])
        return money * 100
    elif "pp" in money:
        money = int(money[:money.find(" ")])
        return money * 1000
    else:
        print("NO_CURRENCY")
        money = 0
        return money


equipment_name_list = ["armor.csv", "weapon.csv", "ammunition.csv", "consumables.csv",
                       "kit.csv", "tool.csv", "gear.csv", "container.csv"]

enl_len = len(equipment_name_list)


def csv_writer(it, count_i, equal):
    with open("parsed_data/ALLItems.csv", "a", encoding="utf-8") as f:
        write = writer(f)
        write.writerow(it)
        if equal:
            write.writerow("/")
    if count_i < enl_len:
        with open("parsed_data/" + equipment_name_list[count_i], "a", encoding="utf-8") as k:
            write = writer(k)
            write.writerow(it)



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
            equality = j == count_web - 1
            s = str(web[j].find_element(By.CLASS_NAME, "header_info").text)
            slice = s.find("\n")
            if i == 0:  # armor
                armor_name = s[:slice]
                armor_type = s[slice + 1:-1]
                armor_type = armor_type[armor_type.find("(") + 1:]
                armor_price = web[j].find_element(By.CLASS_NAME, "coast").text
                armor_price = currency_convert(armor_price)
                armor_class = web[j].find_element(By.CLASS_NAME, "ac").text
                armor_weight = str(web[j].find_element(By.CLASS_NAME, "weight").text)
                if armor_weight == "":
                    armor_weight = 0
                else:
                    armor_weight = int(armor_weight[armor_weight.find(" ") + 1:-5])

                items.append(armor_type)
                items.append(armor_name)
                items.append(armor_price)
                items.append(armor_weight)
                items.append(armor_class)

                csv_writer(items, i, equality)

            elif i == 1:  # weapon
                weapon_name = s[:slice]
                weapon_name = weapon_name.replace(", ", " ")
                weapon_type = s[slice + 1:-1]
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

                items.append(weapon_type)
                items.append(weapon_name)
                items.append(weapon_price)
                items.append(weapon_weight)
                items.append(weapon_damage)
                items.append(weapon_properties)

                csv_writer(items, i, equality)

            elif i == 2:  # ammunition
                ammunition_name = s[:slice]
                ammunition_type = s[slice + 1:]
                ammunition_price = str(web[j].find_element(By.CLASS_NAME, "coast").text)
                ammunition_price = currency_convert(ammunition_price)
                ammunition_weight = str(web[j].find_element(By.CLASS_NAME, "weight").text)
                if ammunition_weight == "":
                    ammunition_weight = 0
                else:
                    ammunition_weight = ammunition_weight[ammunition_weight.find(" ") + 1:-5]
                # float and int problem

                items.append(ammunition_type)
                items.append(ammunition_name)
                items.append(ammunition_price)
                items.append(ammunition_weight)

                csv_writer(items, i, equality)

            elif i == 3:  # consumables
                consumables_name = s[:slice]
                consumables_name = consumables_name.replace(", ", " ")
                consumables_type = s[slice + 1:]
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

                items.append(consumables_type)
                items.append(consumables_name)
                items.append(consumables_price)
                items.append(consumables_weight)

                csv_writer(items, i, equality)

            elif i == 4:  # kit
                kit_name = s[:slice]
                kit_type = s[slice + 1:]
                kit_price = str(web[j].find_element(By.CLASS_NAME, "coast").text)
                kit_price = currency_convert(kit_price)
                kit_weight = str(web[j].find_element(By.CLASS_NAME, "weight").text)
                if kit_weight == "":
                    kit_weight = 0
                else:
                    kit_weight = kit_weight[kit_weight.find(" ") + 1:-5]

                items.append(kit_type)
                items.append(kit_name)
                items.append(kit_price)
                items.append(kit_weight)

                csv_writer(items, i, equality)

            elif i == 5:  # tool
                tool_name = s[:slice]
                tool_name = tool_name.replace(", ", " ")
                tool_type = s[slice + 1:]
                tool_price = str(web[j].find_element(By.CLASS_NAME, "coast").text)
                tool_price = currency_convert(tool_price)
                tool_weight = str(web[j].find_element(By.CLASS_NAME, "weight").text)
                if tool_weight == "":
                    tool_weight = 0
                else:
                    tool_weight = tool_weight[tool_weight.find(" ") + 1:-5]

                items.append(tool_type)
                items.append(tool_name)
                items.append(tool_price)
                items.append(tool_weight)

                csv_writer(items, i, equality)

            elif i == 6:  # gear
                gear_name = s[:slice]
                gear_name = gear_name.replace(", ", " ")
                gear_type = s[slice + 1:]
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

                items.append(gear_type)
                items.append(gear_name)
                items.append(gear_price)
                items.append(gear_weight)

                csv_writer(items, i, equality)

            elif i == 7:  # container
                container_name = s[:slice]
                container_name = container_name.replace(", ", " ")
                container_type = s[slice + 1:]
                container_price = str(web[j].find_element(By.CLASS_NAME, "coast").text)
                container_price = currency_convert(container_price)
                container_weight = str(web[j].find_element(By.CLASS_NAME, "weight").text)
                container_weight = container_weight[container_weight.find(" ") + 1:-5]
                if container_weight.isdigit():
                    container_weight = int(container_weight)
                elif "/" in container_weight:
                    container_weight = float(container_weight[0]) / float(container_weight[2])
                else:
                    container_weight = 0

                items.append(container_type)
                items.append(container_name)
                items.append(container_price)
                items.append(container_weight)

                csv_writer(items, i, equality)

            # elif i == 8:  # arcane focus
            #     continue
            # elif i == 9:  # druidic focus
            #     continue
            # elif i == 10:  # holly simbol
            #     continue
            # elif i == 11:  # clothes
            #     continue
            # elif i == 12:  # camp
            #     continue
            else:
                print("Parse complete")
                break

            print(items)
            items.clear()

        labels[i].click()
    driver.close()
shutil.rmtree("parsed_data")
if not path.exists("parsed_data"):
    mkdir("parsed_data")

get_info()