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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD1vNsUS65RMXkBn-pR3QYl49OaMxZhNNA',
    appId: '1:68415664216:android:fb83d2a7c5c7aa015dda2d',
    messagingSenderId: '68415664216',
    projectId: 'chatgpt-bb1f5',
    storageBucket: 'chatgpt-bb1f5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBrJsemm1lnLCW1U8XGJ1qYnG267sbVJIE',
    appId: '1:68415664216:ios:0e2549de01ba10d35dda2d',
    messagingSenderId: '68415664216',
    projectId: 'chatgpt-bb1f5',
    storageBucket: 'chatgpt-bb1f5.appspot.com',
    androidClientId: '68415664216-09qq6d97lopqht4d2on55kl4k960t4sr.apps.googleusercontent.com',
    iosClientId: '68415664216-68jqnca0jsr9vucneiukgq846o82o5j8.apps.googleusercontent.com',
    iosBundleId: 'com.example.sadague',
  );
}