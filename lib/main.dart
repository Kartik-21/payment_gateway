import 'package:flutter/material.dart';
import 'package:payment_gateway/screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: true,
        title: "Payment Gateway",
        theme: ThemeData(
            primaryColor: Colors.blue,
            accentColor: Colors.blueAccent,
            brightness: Brightness.dark),
        home: HomeScreen());
  }
}
