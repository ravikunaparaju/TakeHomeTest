# my-sample-app-test

XCUITests demo to run checkout out tests on iOS sample app

# Test cases
  - Verify product e.g backpack of different colors to added to cart
  - Verify remove products from cart screen
      - Remove product by remove button
      - Remove product by decreasing quantity
  - Verify empty cart and navigate to shopping from go shopping button
  - Verify added product quantity is correctly displayed in Cart
  - Verify update product quantity from cart
  - Verify complete checkout and cart is empty

# Xcode build version and Simulators
Tests are built and exuted on Xcode 16.4 - iPhone 16 pro max 18.6, iPhone 16 18.6, iPhone 16 - 18.0

## To execute tests
- checkout out code from `git@github.com:ravikunaparaju/TakeHomeTest.git`
- Open `My Demo App.xcworkspace` from Xcode
- Navigate to MyDemoAppUITests -> Tests
- click on the diamond icon beside the class name to play the tests

Note: `testMultiColorProductAddedDisplayedInCart` will fail to capture defect





https://github.com/user-attachments/assets/9a8c86a6-6e17-43ec-b9c4-ff4e27d68054






# Defects

  - Color of the added products is not correctly shown on cart screen
<img width="300" height="500" alt="Simulator Screenshot - iPhone 16 Pro - 2025-08-13 at 12 37 11" src="https://github.com/user-attachments/assets/5d2a7b2d-307d-4676-85ce-ca49f33927ee" />


  - Items quantity on bottom cart icon 100 is not clearly visible
<img width="300" height="500" alt="Simulator Screenshot - iPhone 16 Pro - 2025-08-13 at 12 37 43" src="https://github.com/user-attachments/assets/07f9b27f-be8b-4794-9035-55adeef1bb8a" />


  - App crashes if user taps catalog button from shipping address screen
  - After successfull login, back navigation on shipping screen shows Login
  - Cart is not cleared after checkout is complete
  - continue shopping button is overlapped with checkout complete text
<img width="300" height="500" alt="Simulator Screenshot - iPhone 16 Pro - 2025-08-13 at 12 44 26" src="https://github.com/user-attachments/assets/5cc2b53e-1c2d-49bb-875f-fd645dd240cf" />






