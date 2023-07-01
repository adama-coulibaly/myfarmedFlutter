import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfarmed/PackagesContenues/ShopTopBar.dart';
import 'package:myfarmed/PackagesContenues/bottomBar.dart';

import '../PackagesContenues/CategoryContenues.dart';
import '../PackagesContenues/Shopproducts.dart';

class Shoppage extends StatelessWidget {
  const Shoppage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        elevation: 0,
          flexibleSpace: ShopTopBar(),
      ),
      body: ListView(
        children: [
            SizedBox(
            height: 15,
          ),
          Container(
            //height: 500,
            padding: EdgeInsets.only(top: 15),

            decoration: const BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                )),

            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Recherche ici"),
                        ),
                      ),
                      Spacer(),
                      const Icon(
                        Icons.camera_alt,
                        size: 27,
                        color: Colors.green,
                      )
                    ],
                  ),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: const Text(
                    "Catégories",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.green),
                  ),
                ),
                //::::::::::::::::::::::::::::::::::: CONTENUES CATEGORIES :::::::::::::::::::::::::::::::
                CategoryContenues(),

                //::::::::::::::::::::::::::::::::::: TEXT PRODUITS :::::::::::::::::::::::::::::::::::::

                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Meuilleur produits",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 20),
                  ),
                ),

                //:::::::::::::::::::::::::::::::::::::::::::::::: LES PRODUITS :::::::::::::::::::::::::::::::::::::::
                Shopproducts(),
              ],
            ),
          )
        ],
      ),
    //  bottomNavigationBar: bottomBar(),
    );
  }
}
