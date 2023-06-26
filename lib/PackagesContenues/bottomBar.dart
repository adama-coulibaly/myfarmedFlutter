import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class bottomBar extends StatefulWidget {
  const bottomBar({Key? key}) : super(key: key);

  @override
  State<bottomBar> createState() => _State();
}

class _State extends State<bottomBar> {

  List onglets = [
    {"id": 1, "name_onglet": 'accueil',"Icon":Icons.home_outlined},
    {"id": 2, "name_onglet": 'forum',"Icon":Icons.chat_outlined},
    {"id": 3, "name_onglet": 'marché',"Icon":Icons.shop}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: const Padding(
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





        ),
      ),);
  }
  /*Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(2),
            child: BottomNavigationBar(


              backgroundColor: Colors.blue,
              selectedFontSize: 15,
              selectedItemColor: Colors.white,
              selectedIconTheme: IconThemeData(),

              onTap: (onglets) {
                print("data ");
              },

              items: onglets.map(
                      (item) =>
                          BottomNavigationBarItem(
                            icon: Icon(item['Icon']), label: item['name_onglet'],
                          ),
              )

                  .toList(),
            ),);
  }*/
}

