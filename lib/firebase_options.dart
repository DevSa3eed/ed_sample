import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class CustomFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'Web platform is not supported by the current Firebase configuration.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'macOS platform is not supported by the current Firebase configuration.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'Windows platform is not supported by the current Firebase configuration.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'Linux platform is not supported by the current Firebase configuration.',
        );
      default:
        throw UnsupportedError(
          'The current platform is not supported by the Firebase configuration.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3NdRVW-RandomizedApiKeyForAndroid',
    appId: '1:1234567890:android:randomizedAppIdForAndroid',
    messagingSenderId: '123456789012',
    projectId: 'randomized-project-id-android',
    storageBucket: 'randomized-android-bucket.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5NzCXW-RandomizedApiKeyForiOS',
    appId: '1:0987654321:ios:randomizedAppIdForiOS',
    messagingSenderId: '098765432109',
    projectId: 'randomized-project-id-ios',
    storageBucket: 'randomized-ios-bucket.appspot.com',
    iosBundleId: 'com.example.randomizedIOSBundleId',
  );
}
