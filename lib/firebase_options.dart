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
    apiKey: 'AIzaSyBieru0BI0uAS6xViG97DJVjB7Dc7JkI_Y',
    appId: '1:335914399889:web:8b66082074564a237a2730',
    messagingSenderId: '335914399889',
    projectId: 'readventure-d8d78',
    authDomain: 'readventure-d8d78.firebaseapp.com',
    storageBucket: 'readventure-d8d78.firebasestorage.app',
    measurementId: 'G-N51BB8B6B1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCY7v7vJsLTudBL-O5fUTtZvcPk-rFNy_o',
    appId: '1:335914399889:android:c3f1555dc1c85f287a2730',
    messagingSenderId: '335914399889',
    projectId: 'readventure-d8d78',
    storageBucket: 'readventure-d8d78.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCyLILDA0KINjGFinCJWr2OP2ZskqTci98',
    appId: '1:335914399889:ios:787f700231de158b7a2730',
    messagingSenderId: '335914399889',
    projectId: 'readventure-d8d78',
    storageBucket: 'readventure-d8d78.firebasestorage.app',
    iosBundleId: 'com.example.readventure',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCyLILDA0KINjGFinCJWr2OP2ZskqTci98',
    appId: '1:335914399889:ios:787f700231de158b7a2730',
    messagingSenderId: '335914399889',
    projectId: 'readventure-d8d78',
    storageBucket: 'readventure-d8d78.firebasestorage.app',
    iosBundleId: 'com.example.readventure',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBieru0BI0uAS6xViG97DJVjB7Dc7JkI_Y',
    appId: '1:335914399889:web:b02ae0742e885e0c7a2730',
    messagingSenderId: '335914399889',
    projectId: 'readventure-d8d78',
    authDomain: 'readventure-d8d78.firebaseapp.com',
    storageBucket: 'readventure-d8d78.firebasestorage.app',
    measurementId: 'G-L712P6D0PV',
  );
}
