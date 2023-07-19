import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myfarmed/Pages/HomePage.dart';
import 'package:myfarmed/Pages/ShopPage.dart';
import 'package:myfarmed/Pages/cardPage.dart';
import 'package:myfarmed/Pages/formationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Pages/fermePage.dart';
import '../Pages/forumPage.dart';
import 'formationVideaoFrame.dart';

class bottomBar extends StatefulWidget {
  const bottomBar({Key? key}) : super(key: key);

  @override
  State<bottomBar> createState() => _State();
}

class _State extends State<bottomBar> {

  int _selectedIndex = 0;

  static final List<Widget> _widgetOption =<Widget>[
    const Homepage(),
    const Shoppage(),
    const fermePage(),
    const formationPage(),
    const forumPage(),
  ];

/*  List onglets = [
    {"id": 1, "name_onglet": 'accueil',"Icon":Icons.home_outlined},
    {"id": 2, "name_onglet": 'forum',"Icon":Icons.chat_outlined},
    {"id": 3, "name_onglet": 'marché',"Icon":Icons.shop}
  ];*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: _widgetOption.elementAt(_selectedIndex),
        ),
        bottomNavigationBar:  Container(
          color: Colors.green,
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
            child: GNav(

              padding: const EdgeInsets.all(5),
              color: Colors.white,
              activeColor: Colors.green,
              gap: 8,
              tabBackgroundColor: Colors.white,




              tabs: const [

                GButton(icon: Icons.home_outlined,text: "Accueil",iconSize: 35),
                GButton(icon: Icons.shopping_cart_outlined,text: "Marché",iconSize: 35),
                GButton(icon: Icons.home_work_outlined,text: "Ferme",iconSize: 35),
                GButton(icon: Icons.school_outlined,text: "Formation",iconSize: 35),
                GButton(icon: Icons.forum_outlined,text: "Forum",iconSize: 35),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index){
                setState(() {
                  _selectedIndex = index;
                });
              },




            ),
          ),),
      ),
    );
  }
  /*
   Container(
      color: Colors.blueGrey,
      child:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
        child: GNav(

          padding: EdgeInsets.all(10),
          color: Colors.white,
          activeColor: Colors.green,
          gap: 8,
          tabBackgroundColor: Colors.white54,



          tabs: [

            GButton(icon: Icons.home,text: "Accueil",iconSize: 35),
            //GButton(icon: Icons.chat,text: "Forum",),
            GButton(icon: Icons.shop,text: "Marché",iconSize: 35),
            GButton(icon: Icons.grade,text: "Ferme",iconSize: 35),
            GButton(icon: Icons.confirmation_num_sharp,text: "Formation",iconSize: 35),
          ],
      selectedIndex: _selectedIndex,
          onTabChange: (index){
            setState(() {
              _selectedIndex = index;
            });
          },




        ),
      ),);
  }*/
}

