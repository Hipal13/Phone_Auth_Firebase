import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:phone_auth/Screens/Homepage.dart';
import 'package:phone_auth/firebase_options.dart';

import 'Screens/OnBoadingPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
        title: 'Flutter Demo',
        home: FirebaseAuth.instance.currentUser != null
            ? const Homepage()
            : const Onboadingpage(),
      ),
    );
  }
}
