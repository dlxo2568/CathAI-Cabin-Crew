

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/1.home_screen.dart';

 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
       apiKey: "AIzaSyBYNH3Wsmt50QZZ09Goa8qosoa3AUFerQk",
  authDomain: "connectingfirebasedbtopy-a2562.firebaseapp.com",
  databaseURL: "https://connectingfirebasedbtopy-a2562-default-rtdb.asia-southeast1.firebasedatabase.app",
  projectId: "connectingfirebasedbtopy-a2562",
  storageBucket: "connectingfirebasedbtopy-a2562.appspot.com",
  messagingSenderId: "738803069313",
  appId: "1:738803069313:web:fbc180ffd0a6ea9ad7b880",
  measurementId: "G-74DZQV73MX"
    )
    
  );
  //await Firebase.initializeApp();
  
  runApp(const MyApp());
}

// Global key to access screens without context
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      color: Colors.green[800],
      navigatorKey: navigatorKey,
      routes: {
        HomeScreen.routeName: (ctx) => const HomeScreen(),

      },

    );
  }
}
