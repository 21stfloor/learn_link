import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDiqHc_WwmzVHqXjEtSallQ7gbZ_2JasWk",
            authDomain: "learn-link-el7ijg.firebaseapp.com",
            projectId: "learn-link-el7ijg",
            storageBucket: "learn-link-el7ijg.appspot.com",
            messagingSenderId: "645373172680",
            appId: "1:645373172680:web:9939c4eba5ccd02d14befd"));
  } else {
    await Firebase.initializeApp();
  }
}
