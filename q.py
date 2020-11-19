from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time
# from main import js_write
import pandas as pd

driver = webdriver.Firefox(executable_path="/home/climz/PycharmProjects/D&D_parser/geckodriver")
items = {}

pd.set_option("display.max_rows", None, "display.max_columns", None)
pd.set_option('display.width', 2000)

dd = pd.DataFrame
count = 0

def js_write(it):
    df = pd.DataFrame()
    dd = df.append(it, ignore_index=True)

    print(dd)
    dd.to_json("data.json", force_ascii=False)



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
    combo_box = driver.find_elements(By.CLASS_NAME, "combo_box_content")
    labels = driver.find_elements(By.TAG_NAME, "label")

    count_labels = len(labels)

    for i in range(0, count_labels):
        try:
            labels[i].click()

        except:
            # selenium.common.exceptions.ElementNotInteractableException
            break
        time.sleep(1)
        web = get_cards()
        count_web = len(web)
        for j in range(0, count_web):
            # TRY
            items[web[j].find_element(By.CLASS_NAME, "header_info").text] = web[j].find_element(By.CLASS_NAME,
                                                                                                "coast").text

        labels[i].click()
        #js_write(items)
        print(items)
        items.clear()


get_info()
