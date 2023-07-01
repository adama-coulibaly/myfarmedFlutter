import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myfarmed/PackagesContenues/topbar.dart';

import 'PackagesContenues/bottomBar.dart';
import 'PackagesContenues/homeSlider.dart';
import 'PackagesContenues/motDePasse.dart';
import 'Pages/HomePage.dart';
import 'Pages/ShopPage.dart';
import 'Pages/cardPage.dart';
import 'Pages/formationPage.dart';
import 'Pages/loginPage.dart';
import 'Pages/register.dart';

void main() {
  runApp(MyApp());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          children: [
            Container(
              height: 190,
              width: 190,
              child: Image.asset("assets/images/logo.png"),
            ),
      SizedBox(height: 10,),
      const SpinKitWaveSpinner(
        color: Colors.green,
        waveColor: Colors.green,
        size: 50.0,

      )
          ],
        ),
        nextScreen: loginPage(),splashIconSize: 250,
      duration: 4000,
      splashTransition: SplashTransition.scaleTransition,
      curve: Curves.linear,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        // "/" : (context) => loginPage(),
        "homepage": (context) => Homepage(),
        "loginpage": (context) => loginPage(),
        "cardpage": (context) => cardPage(),
        "shoppingpage": (context) => Shoppage(),
        "formationPage": (context) => formationPage(),
        "RegisterPage": (context) => RegisterPage(),
        "bottomBar": (context) => bottomBar(),
        "forgetLogin": (context) => forgetLogin()
      },
    );
  }
}
