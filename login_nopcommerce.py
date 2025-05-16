import time
import undetected_chromedriver as uc
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Setup undetected Chrome
options = uc.ChromeOptions()
options.add_argument('--no-sandbox')
options.add_argument('--disable-blink-features=AutomationControlled')

driver = uc.Chrome(options=options)

try:
    # Go to the nopCommerce admin demo page
    driver.get("https://admin-demo.nopcommerce.com/")

    # Wait for page to bypass Cloudflare (max 30 seconds)
    WebDriverWait(driver, 30).until(
        EC.presence_of_element_located((By.ID, "Email"))
    )

    # Fill in login credentials
    email_field = driver.find_element(By.ID, "Email")
    password_field = driver.find_element(By.ID, "Password")
    login_button = driver.find_element(By.XPATH, "//button[contains(@class,'login-button')]")

    email_field.clear()
    email_field.send_keys("admin@yourstore.com")

    password_field.clear()
    password_field.send_keys("admin")

    login_button.click()

    # Wait for dashboard to appear
    WebDriverWait(driver, 15).until(
        EC.presence_of_element_located((By.XPATH, "//h1[contains(text(),'Dashboard')]"))
    )

    print("✅ Login successful!")

except Exception as e:
    print("❌ Test failed:", e)

finally:
    time.sleep(3)  # Optional: let you view the dashboard
    driver.quit()
