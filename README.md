# Dungeons_and_Dragons

### Какие библиотеки нужны
> selenium
* pip install selenium
> psycopg2
* pip install psycopg2

### Предварительная настройка
Скачать программный компонент, для связки программы с вашим браузером, в соответствии с его версией.\
Например, для браузера chrome версии 87.0.4280.66 скачать драйвер ChromeDriver 87.0.4280.20.\
Для firefox любой версии geckodriver последней версии(0.28 на данный момент).\
Ссылки на драйверы:\
ChromeDriver - https://chromedriver.chromium.org/downloads \
Geckodriver - https://github.com/mozilla/geckodriver/releases \
Выгрузить драйвер в любое удобное место(можно в сам проект).\
В 8-ой строчке выбрать браузер(firefox или chrome), в поле "executable_path=" указать полный путь до драйвера, который скачали ранее.\
Импортировать файл DnD_equipment.pgsql в СУБД PostgreSQL.

### Запуск
Запустить файл main.py

### Функционал
Парсинг данных.
Загрузка данных в БД.
Запись данных в файлы формата csv.

### Что это?
Программа для парсинга данных с сайта по настольной игре Dungeons and Dragons версия 5, с последующей загрузкой в базу данных.

