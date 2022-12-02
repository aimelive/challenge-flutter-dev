## ChallengeFlutterDev
ChallengeFlutterDev is a challenge given by [AugmentedFuture](https://github.com/augmentedFuture) to build an application engaged in facilitating education for children where learners can access learning contents such as books easily. Built with Flutter and Node JS for Backend.
### Features
* Student can view all books listed from database
* Student can view book details for a specific book
* BE: User can upload new book with a picture into our database
### How to test this app locally

#### Clone this repo 
```bash 
https://github.com/aimelive/challenge-flutter-dev
```

#### Activate the backend

* From the project root directory, cd into `NodeJS-Backend` folder, do `npm install` or `yarn install` to get all dependencies.

* In your `.env` file, fill out all variables as shown in `.env.example`

* Run command `npm run dev` or `npm start` to launch application (BE side). 

N.B: If it runs well you will see successfully message in your terminal.

#### Launch Flutter App

* From the project root directory, cd into `flutter_ui` folder. 
* In your terminal, do `flutter pub get` to get all dependencies. 
* In `lib/shared/constants.dart` provide the correct url apiEndPoint value corresponding to the port/server you're running your Backend, otherwise, you'll not be able to get the books in our App.
* Run command `flutter run` to launch application on selected device/emulator.
#### Platform
* iOS
* Android
* Web
### Prerequisites
*  You must have node installed on your computer
* Flutter SDK
* IDE like VS Code or Android Studio
## Screenshots

![Simulator Screen Shot - iPhone 13 - 2022-07-10 at 07 42 07](https://user-images.githubusercontent.com/98814433/178134313-ac2caf44-90d6-4fc4-b2be-649ea6dbca12.png)
![Simulator Screen Shot - iPhone 13 - 2022-07-10 at 07 42 53](https://user-images.githubusercontent.com/98814433/178134319-7a835534-b1cf-4048-82d0-9efdc1e091cd.png)
### Technologies used
* Flutter
* Node JS
* MongoDB
* Express JS
### Author
* [Aime Ndayambaje](https://github.com/aimelive)
