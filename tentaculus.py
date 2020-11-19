from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time
# from main import js_write
import pandas as pd
import numpy as np
import csv

driver = webdriver.Chrome("C:\chromedriver.exe")


pd.set_option("display.max_rows", None, "display.max_columns", None)
pd.set_option('display.width', 2000)


def js_write(it):
    with open("GFG", "a") as f:
        write = csv.writer(f)
        write.writerow(it)

    #df = pd.DataFrame(it)
    #df.to_csv("data.csv", index=False, mode="a", header=False, line_terminator="\n", sep=",")


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
    items = []
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
            s = web[j].find_element(By.CLASS_NAME, "header_info").text
            l = s.find("\n")
            name = s[:l]
            #items[name] = web[j].find_element(By.CLASS_NAME, "coast").text
            items.append(name)
            items.append(web[j].find_element(By.CLASS_NAME, "coast").text)
            js_write(items)
            print(items)
            items.clear()

        labels[i].click()
    driver.close()

def replace_():
    file = open("GFG", "rt")
    data = file.read()
    data = data.replace("\"", "")
    file.close()
    file = open("GFG", "wt")
    file.write(data)
    file.close()

get_info()
replace_()
