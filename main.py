import psycopg2
import csv

connection = psycopg2.connect(user="postgres",
                              password="Vedug7Vapt",
                              host="localhost",
                              port="5432",
                              database="asdfghjk")

cursor = connection.cursor()

table_name = ["armor", "weapon", "ammunition", "consumables", "kit", "tool", "gear", "container"]

len_list = len(table_name)

with open("parsed_data/ALLItems.csv", "r") as f:
    csv_reader = csv.reader(f)
    count = 1
    next_table = table_name[0]
    index = 0
    for i in csv_reader:
        print("i: " + i[0])
        if i[0] == "/":
            index += 1
            count = 1
            if index == len_list:
                break
            next_table = table_name[index]
            continue
        if next_table == "armor":
            print("ARMOR" + "\n" + str(i))
            cursor.execute("INSERT INTO " + next_table + " VALUES (" + str(count) + ", %s, %s, %s, %s, %s)", i)
        elif next_table == "weapon":
            print("WEAPON" + "\n" + str(i))
            cursor.execute("INSERT INTO " + next_table + " VALUES (" + str(count) + ", %s, %s, %s, %s, %s, %s)", i)
        else:
            print("ALL" + "\n" + str(i))
            cursor.execute("INSERT INTO " + next_table + " VALUES (" + str(count) + ", %s, %s, %s, %s)", i)

        connection.commit()
        count += 1
