// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyAPdgL3IGyfHahL8cz7kXGK_kO29Jx-28M',
    appId: '1:613494267082:web:acbb41d0bd01cffb6ca833',
    messagingSenderId: '613494267082',
    projectId: 'drinkdesk-41cbe',
    authDomain: 'drinkdesk-41cbe.firebaseapp.com',
    storageBucket: 'drinkdesk-41cbe.appspot.com',
    measurementId: 'G-DN1SMM95M4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBehcyGb2Igya4pDdOrAH-DUFF6GTkJ3V0',
    appId: '1:613494267082:android:4537d38ac91ad8876ca833',
    messagingSenderId: '613494267082',
    projectId: 'drinkdesk-41cbe',
    storageBucket: 'drinkdesk-41cbe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-_Dhtk88CRWcqFLmwKOIZDHQiU-t6qDA',
    appId: '1:613494267082:ios:83cd8276613330ad6ca833',
    messagingSenderId: '613494267082',
    projectId: 'drinkdesk-41cbe',
    storageBucket: 'drinkdesk-41cbe.appspot.com',
    iosBundleId: 'com.example.drinkdash',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA-_Dhtk88CRWcqFLmwKOIZDHQiU-t6qDA',
    appId: '1:613494267082:ios:83cd8276613330ad6ca833',
    messagingSenderId: '613494267082',
    projectId: 'drinkdesk-41cbe',
    storageBucket: 'drinkdesk-41cbe.appspot.com',
    iosBundleId: 'com.example.drinkdash',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAPdgL3IGyfHahL8cz7kXGK_kO29Jx-28M',
    appId: '1:613494267082:web:53a800ccb2c1364a6ca833',
    messagingSenderId: '613494267082',
    projectId: 'drinkdesk-41cbe',
    authDomain: 'drinkdesk-41cbe.firebaseapp.com',
    storageBucket: 'drinkdesk-41cbe.appspot.com',
    measurementId: 'G-K1WPQNB9K6',
  );
}