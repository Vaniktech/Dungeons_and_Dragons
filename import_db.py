import psycopg2
import csv

connection = psycopg2.connect(user=input("Input user: "),
                              password=input("Input user password: "),
                              host=input("Input host: "),
                              port=input("Input port: "),
                              database="DnD_equipment")


def import_db():

    cursor = connection.cursor()

    table_name = ["armor.csv", "weapon.csv", "ammunition.csv", "consumables.csv", "kit.csv", "tool.csv", "gear.csv",
                  "container.csv", "arcane_focus.csv", "druidic_focus.csv", "holly_simbol.csv", "clothes.csv",
                  "camp.csv", "explosives.csv", "firearm.csv", "poison.csv", "horse.csv", "for_horse.csv",
                  "water_transport.csv", "food.csv"]

    for name in table_name:
        try:
            with open("parsed_data/" + name, "r") as f:
                csv_reader = csv.reader(f)
                for i in csv_reader:
                    cursor.execute("SELECT * FROM " + name[:-4] + " LIMIT 0")
                    column_names = [desc[0] for desc in cursor.description]
                    column_names.pop(0)
                    if name == "armor.csv":
                        print(name[:-4].upper() + "\n" + str(i))
                        cursor.execute(
                            "INSERT INTO " + name[:-4] + "(" + str((", ".join(column_names))) + ") VALUES (%s, "
                                                                                                "%s, %s, %s, "
                                                                                                "%s, %s, %s, "
                                                                                                "%s, %s)", i)
                    elif name == "weapon.csv" or name == "firearm.csv":
                        print(name[:-4].upper() + "\n" + str(i))
                        cursor.execute("INSERT INTO " + name[:-4] + "(" + str(
                            (", ".join(column_names))) + ") VALUES (%s, %s, %s, %s, %s, %s)", i)
                    elif name == "poison.csv" or name == "food.csv":
                        print(name[:-4].upper() + "\n" + str(i))
                        cursor.execute(
                            "INSERT INTO " + name[:-4] + "(" + str((", ".join(column_names))) + ") VALUES (%s, %s, %s)",
                            i)
                    elif name == "poison.csv" or name == "food.csv":
                        print(name[:-4].upper() + "\n" + str(i))
                        cursor.execute(
                            "INSERT INTO " + name[:-4] + "(" + str((", ".join(column_names))) + ") VALUES (%s, %s, %s)",
                            i)
                    else:
                        print(name[:-4].upper() + "\n" + str(i))
                        cursor.execute(
                            "INSERT INTO " + name[:-4] + "(" + str(
                                (", ".join(column_names))) + ") VALUES (%s, %s, %s, %s)", i)
                    connection.commit()
        except FileNotFoundError:
            with open("another_data/" + name, "r") as f:
                csv_reader = csv.reader(f)
                for i in csv_reader:
                    cursor.execute("SELECT * FROM " + name[:-4] + " LIMIT 0")
                    column_names = [desc[0] for desc in cursor.description]
                    column_names.pop(0)
                    if name == "armor.csv":
                        print(name[:-4].upper() + "\n" + str(i))
                        cursor.execute("INSERT INTO " + name[:-4] + "(" + str((", ".join(column_names))) + ") VALUES "
                                                                                                           "(%s, %s, "
                                                                                                           "%s, %s, "
                                                                                                           "%s, %s, "
                                                                                                           "%s, %s, "
                                                                                                           "%s)", i)
                    elif name == "weapon.csv" or name == "firearm.csv":
                        print(name[:-4].upper() + "\n" + str(i))
                        cursor.execute("INSERT INTO " + name[:-4] + "(" + str((", ".join(column_names))) + ") VALUES "
                                                                                                           "(%s, %s, "
                                                                                                           "%s, %s, "
                                                                                                           "%s, %s)", i)
                    elif name == "poison.csv" or name == "food.csv" or name == "for_horse.csv":
                        print(name[:-4].upper() + "\n" + str(i))
                        cursor.execute("INSERT INTO " + name[:-4] + "(" + str((", ".join(column_names))) + ") VALUES "
                                                                                                           "(%s, %s, "
                                                                                                           "%s)", i)
                    else:
                        print(name[:-4].upper() + "\n" + str(i))
                        cursor.execute(
                            "INSERT INTO " + name[:-4] + "(" + str((", ".join(column_names))) + ") VALUES (%s, %s, "
                                                                                                "%s, %s)", i)
                    connection.commit()
    print("Import complete")
