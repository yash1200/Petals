# Petals

I don't know why the name "Petals"

Petals is a project made with Flutter, with Node Js as Backend and with MongoDB as Database.

Petals is a service with which we can avoid touching unnecessary things at restaurants and avoid exposure to germs and viruses in this post COVID world by following certain measures.

Petals will show you every possible detail about a restaurant like menu, name of owner, phone number, email (if available) and other details just by scanning a QR-code at the restaurant.

## Supported Platforms

* Android
* iOS
* Web (Petal)
* Linux (Petal)

## To run the project

1. Start Mongodb

    ```
    sudo systemctl start mongodb
    mongo
    ```

2. Start server

    ```
    cd backend
    npm i
    npx nodemon index
    ```
3. Change IP of API calls

    ```
    nano [app]/lib/values/strings.dart
    ```
    And update the "ip" value with the ip of your server.


4. Run Petals

    ```
    flutter run --release
    ```

    or build apk

    ```
    flutter build apk --release
    ```

## Petals

Home Screen                         |  Details Screen
:----------------------------------:|:----------------------------------:
![](https://imgur.com/CkgbR7u.png)  |  ![](https://imgur.com/gv2eOyp.png)


## Petals Business

Home Screen                         |  Edit Details Screen
:----------------------------------:|:----------------------------------:
![](https://imgur.com/Sb0tgWK.png)  |  ![](https://imgur.com/GvLTEVT.png)

## Created & Maintained By

[Yash Johri](https://yash1200.github.io/#/)

[<img align="left" alt="yash1200 | Twitter" width="30px" src="https://image.flaticon.com/icons/svg/733/733579.svg" />][twitter]
[<img align="left" alt="yash1200 | LinkedIn" width="30px" src="https://avatars3.githubusercontent.com/u/357098?s=200&v=4" />][linkedin]
[<img align="left" alt="yash1200 | Instagram" width="30px" src="https://image.flaticon.com/icons/svg/174/174855.svg" />][instagram]
[<img align="left" alt="yash1200 | Medium" width="30px" src="https://cdns.iconmonstr.com/wp-content/assets/preview/2018/240/iconmonstr-medium-3.png" />][medium]

[twitter]: https://twitter.com/YashJohri17
[instagram]: https://www.instagram.com/just_johri/
[linkedin]: https://www.linkedin.com/in/yash-johri-61014717b/
[medium]: https://medium.com/@yashjohri1200
