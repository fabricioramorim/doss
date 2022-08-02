// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'responsive/login/home.dart';
import 'responsive/login/login_mobile.dart';
import 'responsive/login/login_desktop.dart';
import 'package:doss/responsive/layout.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Doss(),
    );
  }
}

class Doss extends StatefulWidget {
  const Doss({Key? key}) : super(key: key);

  @override
  State<Doss> createState() => _Doss();
}

class _Doss extends State<Doss> {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return const ResponsiveLayout(
                  loginPage: loginPage(), loginPageDesktop: loginPageDesktop());
            }
          }));
}
