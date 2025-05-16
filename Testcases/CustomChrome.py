# CustomChrome.py

from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service

def get_chrome_driver_options_and_service(chrome_path, driver_path):
    options = Options()
    options.binary_location = chrome_path
    service = Service(executable_path=driver_path)
    return options, service
