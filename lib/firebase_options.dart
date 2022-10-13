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
    apiKey: 'AIzaSyDyR8NooRyCYbFCuEkNRqxc-T03SzAgYRQ',
    appId: '1:445953411314:web:7e987cec58e3222519286b',
    messagingSenderId: '445953411314',
    projectId: 'supercalipso-8ac63',
    authDomain: 'supercalipso-8ac63.firebaseapp.com',
    storageBucket: 'supercalipso-8ac63.appspot.com',
    measurementId: 'G-CWZGFEJ1ZL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCacUM-In4Wd9SNNJLgMofkBdBQ1yFPbZ4',
    appId: '1:445953411314:android:3eb13cba19dbb21b19286b',
    messagingSenderId: '445953411314',
    projectId: 'supercalipso-8ac63',
    storageBucket: 'supercalipso-8ac63.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-nb40DNB8GS4YoVbAkmwiFcQwWyUSLqY',
    appId: '1:445953411314:ios:c3db08b47daf0b3419286b',
    messagingSenderId: '445953411314',
    projectId: 'supercalipso-8ac63',
    storageBucket: 'supercalipso-8ac63.appspot.com',
    iosClientId: '445953411314-n4j7nln3d3c8f3on8elr286v5d8up8ls.apps.googleusercontent.com',
    iosBundleId: 'dev.menghini.supercalipso',
  );
}