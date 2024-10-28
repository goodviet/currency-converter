

`App Mobile Currency Converter - Flutter `

# Build with 

The project is implemented with accompanying technologies:

[![My Skills](https://skillicons.dev/icons?i=dart,flutter&theme=light)](https://skillicons.dev)
- **API**: [exchangerate-api.com](https://www.exchangerate-api.com)


# Currency Mobile App

Currency Converter app allows users to convert between different currencies, updating discount rates in real time. The app uses API to fetch rate data and provides a more user-friendly interface

## Features

- Select base currency and destination currency.
- Enter the amount to convert.
- Automatically update exchange rates.
- Clearly display conversion results.
- Reset application values ​​and status to default.

## Installation

1. Clone the repository to your local machine using Git:

   ```sh
   git clone https://github.com/goodviet/currency-converter.git
   ```
2. Navigate to the project directory:

   ```sh
   cd currency
   ```
3. Install the necessary dependencies using npm and pub get (Node.js and Flutter package managers):

   ```sh
   flutter pub get 
   ```

4. Start the development server and flutter:

   ```sh
   flutter run
   ```
5. Directory structure

    ```
    currency-converter/
    ├── lib/
    │   ├── service/
    │   │   └── service.app.dart          
    │   ├── widget/
    │   │   ├── button.widget.dart       
    │   │   ├── dropdown.widget.dart      
    │   │   └── textfield.widget.dart      
    │   └── main.dart                     
    ├── pubspec.yaml                     
    └── README.md    

    ```                     

## Video Demo 

   ```sh
   https://youtu.be/O7gy2cQ1mvo
   ```

## Usage

- Open the app: When the app starts, you will see the main interface with a TextField to enter the amount and two dropdowns to select the currency.

- Enter Amount: Enter the amount to convert into the TextField. The total amount will be automatically updated based on the current exchange rate.

- Select Currency: Use the dropdown to select the base currency and the destination currency. The exchange rate will be automatically updated when changing the currency.

- Reset: Press the "Reset" button to return all values ​​to default.


## Author
- Minh Dat

## References

- Flutter Documentation: [https://docs.flutter.dev/](https://docs.flutter.dev/)
