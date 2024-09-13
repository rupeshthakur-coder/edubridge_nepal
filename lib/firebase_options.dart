import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAu3QZnmP9I1G-Obda1QaZV5ssF-0nGS2U',
    appId: '1:499904403021:web:5e19055b15adf774772e04',
    messagingSenderId: '499904403021',
    projectId: 'edunepal-e2740',
    authDomain: 'edunepal-e2740.firebaseapp.com',
    storageBucket: 'edunepal-e2740.appspot.com',
    measurementId: 'G-L2611F5ETB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrfPR6G5UD3nT5j3jwh_c9F0fVlM-V2gA',
    appId: '1:499904403021:android:01f904785369b297772e04',
    messagingSenderId: '499904403021',
    projectId: 'edunepal-e2740',
    storageBucket: 'edunepal-e2740.appspot.com',
  );
}
