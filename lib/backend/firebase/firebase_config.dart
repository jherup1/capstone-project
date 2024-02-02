import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBD7zoR8IGqcxH7BfVtJ_p5UkT641BQzTY",
            authDomain: "psysearch-84c1b.firebaseapp.com",
            projectId: "psysearch-84c1b",
            storageBucket: "psysearch-84c1b.appspot.com",
            messagingSenderId: "1094210897330",
            appId: "1:1094210897330:web:78f2672678d2f81078d0ab",
            measurementId: "G-22XGM85B1H"));
  } else {
    await Firebase.initializeApp();
  }
}
