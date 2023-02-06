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
        return macos;
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
    apiKey: 'AIzaSyBhLH2Gt3Ze87MPYDIsDKABVXJsyDrmtx0',
    appId: '1:475359314545:web:622d948d26e27979a9d1d0',
    messagingSenderId: '475359314545',
    projectId: 'deal-4a677',
    authDomain: 'deal-4a677.firebaseapp.com',
    storageBucket: 'deal-4a677.appspot.com',
    measurementId: 'G-0QZC6GWZ5H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCP1g_qIKPToXONBhebbX38gZp_uPaErTE',
    appId: '1:475359314545:android:e852d53c445c11a8a9d1d0',
    messagingSenderId: '475359314545',
    projectId: 'deal-4a677',
    storageBucket: 'deal-4a677.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxVVIKtk7JnKq8yqPv4lIhJ_bhkAIDOWw',
    appId: '1:475359314545:ios:52bbd447223604bda9d1d0',
    messagingSenderId: '475359314545',
    projectId: 'deal-4a677',
    storageBucket: 'deal-4a677.appspot.com',
    iosClientId: '475359314545-9370ut7oa9feosnjmbcjgd1s1e7c3tlp.apps.googleusercontent.com',
    iosBundleId: 'com.example.deal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCxVVIKtk7JnKq8yqPv4lIhJ_bhkAIDOWw',
    appId: '1:475359314545:ios:52bbd447223604bda9d1d0',
    messagingSenderId: '475359314545',
    projectId: 'deal-4a677',
    storageBucket: 'deal-4a677.appspot.com',
    iosClientId: '475359314545-9370ut7oa9feosnjmbcjgd1s1e7c3tlp.apps.googleusercontent.com',
    iosBundleId: 'com.example.deal',
  );
}