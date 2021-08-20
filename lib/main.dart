import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_appfinal/splash.dart';
import 'Firebase_file.dart';
import 'home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'introScreen.dart';
import 'package:http/http.dart' as http ;
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
void main() {

  //runApp(MaterialApp(home: token == null ? Login() : Home()));
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp( MyApp());
}
ThemeData _light=ThemeData.light().copyWith(
  primaryColor: Colors.indigo,
);
ThemeData _Dark=ThemeData.dark().copyWith(
  primaryColor: Colors.blueGrey,
);
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: _Dark,
      theme: _light,
      themeMode: isDark ? ThemeMode.dark:ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

