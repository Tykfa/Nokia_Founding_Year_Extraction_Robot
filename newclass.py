import time

from selenium import webdriver
from selenium.webdriver import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options

google_URL = "https://www.google.com"
cookies_accept_button = "//div[contains(@class, 'QS5gu') and contains(@class, 'sy4vM')]"
search_bar = "//textarea[contains(@class, 'gLFyf')]"
search_content = "Nokia Wikipedia"
nokia_wiki_address = "//h3[contains(@class, 'LC20lb') and contains(@class, 'MBeuO') and contains(@class, 'DKV0Md')]"
year_xpath_title = "//*[@title=1865]"
wikipedia_URL = ""
screenshot_file = ""

options = Options()
driver = webdriver.Firefox()
driver.get(google_URL)
robot = driver.find_element(By.XPATH, cookies_accept_button)
robot.click()
robot = driver.find_element(By.XPATH, search_bar)
robot.click()
robot.send_keys(search_content)
robot.send_keys(Keys.RETURN)
time.sleep(2)
try:
    wikipedia_link = driver.find_element(By.PARTIAL_LINK_TEXT, "Wiki")
    robot = driver.find_element(By.XPATH, nokia_wiki_address)
    robot.click()
    screenshot_file = driver.save_screenshot('Nokia_Wiki_Site_Screenshot.png')
    robot = driver.find_element(By.CLASS_NAME, "mw-page-title-main")
    title = robot.text
    assert title == "Nokia"
    robot = driver.find_element(By.XPATH, year_xpath_title)
    rok = robot.text
    assert "1865" == rok
    # test teardown to close the browser
    driver.quit()
except:
    print("chuj")
