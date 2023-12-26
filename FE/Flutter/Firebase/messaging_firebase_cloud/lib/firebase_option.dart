// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOption {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnimplementedError(
            'DefaultFirebaseOptions are not supported for this platform.');
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: 'AIzaSyDhLqE3VUaiPfh9K0B6EtZMoz2T3QSAH-w',
      appId: '1:126352699675:android:f55521028040eabbfc23be',
      messagingSenderId: '126352699675',
      projectId: 'demofirebase-c5411');
  static const FirebaseOptions ios = FirebaseOptions(
      apiKey: 'AIzaSyDIjZzOhnmz_3glPKzes6kdT6Xc-TUZoZ4',
      appId: '1:126352699675:ios:90be41066d6e2305fc23be',
      messagingSenderId: '126352699675',
      projectId: 'demofirebase-c5411');
}
