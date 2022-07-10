# challenge-flutter-dev
Flutter Challenge to build the app which will make easy the read of books for both children and adults.

## How to run this project

Clone this repo `https://github.com/Niyizibyose/ChallengeFlutterDev.git`

#### Activate the backend

cd into `NodeJS-Backend` folder, do `npm install` or `yarn install` to get all dependencies. NB: You must have node installed on your computer.

In your .env file, fill out all variables as shown in .env.example

then run the backend by `npm run dev` or `npm start`. If it runs successfully will console log in your terminal the port, server and database connected successfully message.

After running the Backend, we are now shifting to the fronted.

cd into `flutter_ui` folder. In your terminal, do `flutter pub get` to get all dependencies. In `lib/shared/constants.dart` provide the correct url apiEndPoint value according to the port/server you're running your Backend, otherwise, you'll not be able to get the books in our App.

After do `flutter run` command to run the App in your selected simulator/emulator/web/ or real device.

Built by Aime Ndayambaje ( https://github.com/aimelive )
