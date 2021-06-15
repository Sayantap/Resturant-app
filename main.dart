import 'package:flutter/material.dart';
import 'package:punjabi/Homepage.dart';
import 'package:punjabi/LoginPage.dart';
import 'package:punjabi/contactus.dart';
import 'package:punjabi/Startup.dart';
import 'package:punjabi/signup.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:punjabi/Table_book.dart';
import 'package:punjabi/Fetchmenu.dart';
import 'sublist.dart';
import 'Profile.dart';
void main() {
  //HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Punjabi Sunrise',
      // MaterialApp contains our top-level Navigator
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => Body(),
       // '/login': (BuildContext context) => Show(),
      //  Route.routeName: (BuildContext context) => new Route(title: "MyItemsPage"),
        //'/home': (BuildContext context) => Body(),
        //'/signup': (BuildContext context) =>Sign()
      },
    );
  }
}


