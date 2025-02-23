# 🔍 Lost & Found App 🏷️

https://drive.google.com/drive/folders/1GM_tx8qqCALFRPdoppxsrmYFwyMXowzr?usp=drive_link

Welcome to the **Lost & Found App** repository! This app is designed to help users report lost items and find items that others have found. It is built using **Flutter** for the frontend and **Firebase** as the backend. The app is user-friendly, visually appealing, and leverages modern technologies to provide a seamless experience. 🚀

---
## ✨ Features ✨
✅ **User Authentication**: Secure login and registration using Firebase Authentication. 🔐  
✅ **Report Lost Items**: Users can report lost items with details like item name, description, category, and image. 📝  
✅ **Report Found Items**: Users can report found items with similar details. 📸  
✅ **Search Functionality**: Users can search for lost or found items based on keywords and categories. 🔎  
✅ **Item Matching**: The app suggests potential matches between lost and found items. 🤝  
✅ **User Profiles**: Users can manage their profiles and view their reported items. 🏷️  
✅ **Notifications**: Real-time notifications for item matches or updates. 🔔  
✅ **Attractive UI**: A clean and modern user interface built with Flutter. 🎨  

---
## 🛠 Technologies Used
- **Frontend**: Flutter (Dart) 🦄
- **Backend**: Firebase (Firestore, Authentication, Storage) 🔥
- **State Management**: Provider or Riverpod (optional) 🔄
- **Image Picker**: For uploading images of lost/found items. 📷
- **Cloud Storage**: Firebase Storage for storing images. ☁️
- **Database**: Firebase Firestore for storing item details and user data. 📊

---
## 🚀 How to Build and Run the App

### 📌 Prerequisites
- **Flutter SDK**: Ensure Flutter is installed on your machine. If not, follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install). 🔧
- **Firebase Project**: Create a Firebase project on the Firebase Console. 🎛️
- **Firebase Configuration**:
  - Add an Android/iOS app to your Firebase project.
  - Download the `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) file.
  - Place the file in the appropriate directory in your Flutter project (`android/app` for Android, `ios/Runner` for iOS). 📂
- **Dependencies**: Add the required Firebase dependencies in your `pubspec.yaml` file. 📜

### 📌 Steps to Run the App
1. **Clone the Repository** 🖥️:
   ```sh
   git clone https://github.com/your-username/lost-and-found-app.git
   cd lost-and-found-app
   ```
2. **Install Dependencies** 📦:
   ```sh
   flutter pub get
   ```
3. **Run the App** 📲:
   ```sh
   flutter run
   ```
4. **Build the App** 🏗️:
   - For Android:
     ```sh
     flutter build apk
     ```
   - For iOS:
     ```sh
     flutter build ios
     ```

---
## 📂 App Structure
```
lib/
│── auth/
│   │── auth.dart
│   │── login_register.dart
│── loginpage/
│   │── loginpage.dart
│   │── register.dart
│── textfield/
│   │── button.dart
│   │── textfield.dart
│── screens/
│   │── splash.dart
│   │── detail_page.dart
│   │── homepage.dart
│   │── post_login_splash_screen.dart
│── models/
│── services/
│── providers/
│── widgets/
│── data.dart
│── main.dart
```

---
## 📖 How to Use the App
✅ **Sign Up/Login**: 
   - New users can create an account using their email or Google account. 📩
   - Existing users can log in using their credentials. 🔑
✅ **Report Lost Item**: 
   - Navigate to the "Report Lost Item" screen. 📌
   - Fill in the item details (name, description, category, image). ✏️
   - Submit the form to save the item to Firestore. ✅
✅ **Report Found Item**: 
   - Navigate to the "Report Found Item" screen. 🔎
   - Fill in the item details (name, description, category, image). 📝
   - Submit the form to save the item to Firestore. ✅
✅ **Search for Items**: 
   - Use the search bar to look for lost or found items. 🔍
   - Filter results by category. 📋
✅ **View Matches**: 
   - The app will suggest potential matches between lost and found items. 🔄
   - Users can contact each other to arrange the return of the item. 🤝
✅ **Manage Profile**: 
   - Users can update their profile information and view their reported items. 🎭

---
## 📦 Dependencies (Add to `pubspec.yaml`)
```name: lost_found
description: "A new Flutter project."
publish_to: 'none' # Remove this line if you wish to publish to pub.dev

version: 1.0.0+1

environment:
  sdk: ^3.6.0

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  firebase_core: ^3.11.0
  firebase_auth: ^5.4.2
  cloud_firestore: ^5.6.3
  intl: ^0.18.0
  firebase_storage: ^12.4.3

  # lottie: ^3.3.1
  # flutter_native_splash: ^2.4.5
  # image_picker: ^1.1.2 # Uncomment if needed
  # url_launcher: ^6.3.1 # Uncomment if needed

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  flutter_launcher_icons: "^0.14.3"

flutter_launcher_icons:
  android:  true
  ios: true
  image_path: "images/Lost.png"


flutter:
  uses-material-design: true

  assets:
    - images/Lost.png # Ensure your splash screen image is placed here

  # Add flutter_native_splash configuration
 
```

---
## 🔮 Future Enhancements
🚀 **Chat Feature**: Allow users to chat with each other for item handover. 💬
🚀 **Advanced Search**: Add filters for date and more. 🔍
🚀 **Push Notifications**: Notify users about matches or updates. 🔔
🚀 **Admin Panel**: For managing reported items and users. 🛠️
🚀 **Multi-language Support**: Add support for multiple languages. 🌍

---
## 🤝 Contribution
Feel free to contribute to this project! If you find any bugs or have suggestions for improvements, please open an issue or submit a pull request. 🛠️


![Image](https://github.com/user-attachments/assets/67d12be3-db3d-4313-95a2-ecba6938d5a8)

![Image](https://github.com/user-attachments/assets/013c90bd-5baa-4d96-b6aa-4d63aa981fd9)
![Image](https://github.com/user-attachments/assets/1ab72e57-5329-4c9e-9eb1-5d04d367bdb6)
![Image](https://github.com/user-attachments/assets/2b062f5f-d38e-4684-a74e-08f7f9f0cebb)
![Image](https://github.com/user-attachments/assets/569bd8ac-da05-427a-9e1f-b7ef7cf2ed30)
![Image](https://github.com/user-attachments/assets/1b3c724f-1f83-4142-a46e-d8bbd82b5963)
![Image](https://github.com/user-attachments/assets/e1d8c5c1-dc4d-4d95-acb7-20780686c28b)


---
### 💖 Thank you for checking out the Lost and Found App! We hope this app makes it easier for people to reunite with their lost belongings. Happy coding! 🚀

