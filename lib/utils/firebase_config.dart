import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


class FirebaseConfig {

  static FirebaseOptions get currentPlatform {

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeG_Noua64Ib5uzBjPJ3caQ3GVr_vIcWc',
    appId: '1:819769582190:android:3372de08cc6a2d8ca5bc7f',
    messagingSenderId: '819769582190',
    projectId: 'cafe-revolucion-mesero',
    databaseURL:
    'https://flutterfire-e2e-tests-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'cafe-revolucion-mesero.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdj9Y6pBA5fmrXjIhAQ7cVHyPnTklIYo4',
    appId: '1:819769582190:ios:e6da39f77c0a6dfaa5bc7f',
    messagingSenderId: '819769582190',
    projectId: 'cafe-revolucion-mesero',
    databaseURL:
    'https://flutterfire-e2e-tests-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'cafe-revolucion-mesero.appspot.com',
    androidClientId:
    '819769582190-g3ck05u0a56vh5qsb242ucpluihfdavl.apps.googleusercontent.com',
    iosClientId:
    '819769582190-260mgejskchjk8s5fvn3rckiikjrl28d.apps.googleusercontent.com',
    iosBundleId: 'com.example.cafeteriaRevolucion',
  );

}