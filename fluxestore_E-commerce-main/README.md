    # Fluxestore
___

## A D2C E-Commerce app built in Flutter with NodeJS and MongoDB.

![Thumbnail](https://github.com/Nilav2608/fluxestore_E-commerce/blob/main/screenshots/cover.jpg)


## Getting Started

## Description

Fluxestore is a Direct-to-Consumer (D2C) E-Commerce application developed using the Flutter framework with NodeJS as runtime and MondoBD as database. It provides users with a seamless shopping experience, allowing them to browse, search for, purchase and track a variety of products .

## Features

- Seamless browsing and search for products by category, brand, or keyword.
  
- View detailed product information, including images, descriptions, prices, and ratings.
- Add products to a cart for later purchase.
- Secure checkout process for placing orders.
- Token based User authentication using JWT and account management features.
- Order tracking and history functionality.
- Wishlist feature for saving favorite products.

## Installation

To install and run Fluxestore locally, follow these steps:

1. Clone the repository from GitHub:

```bash
  git clone https://github.com/Nilav2608/fluxestore_E-commerce
```

2. Open a new terminal and run this command  

```bash
  flutter pub get
```

3. Before running this app, go this below mentioned github repository
### [fluxstore-backend-source-code](https://github.com/Nilav2608/fluxstore_backend)
 follow installation process and install the backend

4.As you are running the backend locally we have to get the IPv4 address of your local meachine. So that run this command

 ```bash
  ipconfig
 ```

 copy the IPv4 address, For Example

```bash
   192.168.1.1
```

5. Now create a new .env file inside the app root folder and you will need to add the following environment variables to your .env file

`BASE_URL_PRODUCTION`

6. Now assing the localhost url to the `BASE_URL_PRODUCTION` environment variable. Replace your IPv4 address with "<your IPv4 address>" tag 

Example

```bash
   BASE_URL_PRODUCTION = http://<your IPv4 address>:5000
```

7. Now run this app using terminal or using command pallate.

```bash
   flutter run
```
## UML for Schema modelling and Mapping DTO
### [Figma file link](https://www.figma.com/file/luprctFouG76P8qDZTvl0Z/Fluxstore-Schema-modelling-and-Mapping-DTO?type=whiteboard&node-id=0%3A1&t=7cgjsjl2duQcvi8O-1)
![uml fluxstore](https://github.com/Nilav2608/fluxestore_E-commerce/assets/86877145/837b8bca-bc79-4185-9239-3b0ad92f0ed9)


## Download apk

Before downloading the apk check your processor architecture and download the file accordingly. For latest devices, download arm64 based architecture by using the link below! 
### [fluxstore-apk.zip](https://github.com/Nilav2608/fluxestore_E-commerce/releases/download/v1.0.0/app-apk.zip)

## Usage

Once the application is set up and running, you can access it through your preferred web browser or mobile device. Use the navigation menu to explore different sections of the app, search for products, add items to your cart, and proceed through the checkout process.


## **Remainder**

This project is completely for educational purpose only. The Products caltalog SKU's are designed whith limited resources and features like payment gateway are non-functional as of now!

## License

This project is licensed under the MIT License

## Contact

For sample catalog data, any inquiries or support requests, feel free to contact us at nilavarasuk@gmail.com

