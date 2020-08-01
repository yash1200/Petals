# Petals

I don't know why the name "Petals"

Petals is a project made with Flutter, with Node Js as Backend and with MongoDB as Database.

Petals is a service with which we can avoid touching unnecessary things at restaurants and avoid exposure to germs and viruses in this post COVID world by following certain measures.

Petals will show you every possible detail about a restaurant like menu, name of owner, phone number, email (if available) and other details just by scanning a QR-code at the restaurant.

## To run the project

1. Start Mongodb

    ```
    systemctl start mongodb
    mongo
    ```

2. Start server

    ```
    cd backend
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
