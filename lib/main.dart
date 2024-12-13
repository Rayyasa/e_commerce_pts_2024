// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks, unused_import, prefer_const_literals_to_create_immutables

import 'package:e_commerce_pts_2024/page/detailProduct.dart';
import 'package:e_commerce_pts_2024/page/home.dart';
import 'package:e_commerce_pts_2024/page/productPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Future main() async {
//   await dotenv.load(fileName: ".env");
//   runApp(const MyApp());
// }
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool? intro;
  // String? login;

  // @override
  // void initState() {
  //   super.initState();
  //   cekData(); // Fetch data when the widget is initialized
  // }

  // cekData() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     intro = prefs.getBool('isIntro');
  //     login = prefs.getString('isLogin');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/detailPage': (context) => DetailPage(),
        '/productPage': (context) => ProductPage()
      },
    );
  }
}
