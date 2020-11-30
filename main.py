import tentaculus
import import_db
import shutil
from os import path, mkdir

try:
    shutil.rmtree("parsed_data")
except FileNotFoundError:
    pass
if not path.exists("parsed_data"):
    mkdir("parsed_data")
tentaculus.get_info()
import_db.import_db()
