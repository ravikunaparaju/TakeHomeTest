# my-sample-app-test

XCUITests demo to run checkout out tests on iOS sample app

# Test cases
  - Add product of different colors to cart & verify colors
  - Verify remove products from cart
      - Remove product by remove button
      - Remove product by decreasing quantity
  - Verify empty cart and navigate to shopping from go shopping button
  - Verify added product quantity is correctly displayed in Cart
  - Verify update product quantity from cart
  - Verify proceed to checkout

# Xcode build version and Simulators
Xcode 16.4 - iPhone 16 pro max 18.6, iPhone 16 18.6, iPhone 16 - 18.0


https://github.com/user-attachments/assets/f1ff0ae5-53e7-41af-a12f-d7ef8913ae4c




# Defects

  - Color of the added products is not correctly shown on cart screen
<img width="300" height="500" alt="Simulator Screenshot - iPhone 16 Pro - 2025-08-13 at 12 37 11" src="https://github.com/user-attachments/assets/18e3f294-43a0-447f-b180-43d649778883" />

  - Items quantity on bottom cart icon 100 is not clearly visible
<img width="300" height="500" alt="Simulator Screenshot - iPhone 16 Pro - 2025-08-13 at 12 37 43" src="https://github.com/user-attachments/assets/f7d0f5c8-2927-4f06-af66-926315e203ff" />

  - App crashes if user taps catalog button from shipping address screen
  - After successfull login, back navigation on shipping screen shows Login
  - Cart is not cleared after checkout
  - continue shopping button is overlapped with checkout complete text
<img width="300" height="500" alt="Simulator Screenshot - iPhone 16 Pro - 2025-08-13 at 12 44 26" src="https://github.com/user-attachments/assets/3c001d42-c92a-4492-b09f-a2aeb36edc04" />





