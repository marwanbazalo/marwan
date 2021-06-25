import 'package:flutter/material.dart';
import './UI/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    title: "Egyptian Tourism Guide",
    color: Colors.black,
    debugShowCheckedModeBanner: false,
    home: new Login(),

  ));
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        return null;
      },
    );
  }
}