import 'package:flutter/material.dart';
import 'package:myfarmed/PackagesContenues/topbar.dart';

import 'PackagesContenues/bottomBar.dart';
import 'PackagesContenues/homeSlider.dart';
import 'Pages/HomePage.dart';
import 'Pages/ShopPage.dart';
import 'Pages/cardPage.dart';
import 'Pages/formationPage.dart';
import 'Pages/loginPage.dart';
import 'Pages/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) => loginPage(),
        "loginpage" : (context) => loginPage(),
        "homepage" : (context) => Homepage(),
        "cardpage" : (context) => cardPage(),
        "shoppingpage" : (context) => Shoppage(),
        "formationPage" : (context) => formationPage(),
        "RegisterPage" : (context) => RegisterPage(),
      },

    );
  }
}
