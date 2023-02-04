// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAQWAFnT6ZEqidLSjgNWanI2Kaqi0m1cV8',
    appId: '1:488739913547:web:05e4e0d726be851170f2ce',
    messagingSenderId: '488739913547',
    projectId: 'authentication-practice-b2d4b',
    authDomain: 'authentication-practice-b2d4b.firebaseapp.com',
    storageBucket: 'authentication-practice-b2d4b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHn26lmjCgSozkvAGy_jPz99qfKjOACa8',
    appId: '1:488739913547:android:ed9d81c00d03b6bf70f2ce',
    messagingSenderId: '488739913547',
    projectId: 'authentication-practice-b2d4b',
    storageBucket: 'authentication-practice-b2d4b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNh31VVjqAQyDDw7z--C57nrCg7RAFTaE',
    appId: '1:488739913547:ios:2f2dc4d86601939770f2ce',
    messagingSenderId: '488739913547',
    projectId: 'authentication-practice-b2d4b',
    storageBucket: 'authentication-practice-b2d4b.appspot.com',
    iosClientId: '488739913547-kps2rm08eojesj79javpvvsv9i7mlajs.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseAuthentication',
  );
}