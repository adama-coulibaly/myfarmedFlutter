import 'package:flutter/material.dart';

import '../PackagesContenues/fermeItems.dart';

class fermePage extends StatelessWidget {
  const fermePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Mes fermes",style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 20),),
            Text("1000",style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20),)
          ],
        ),
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
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                //  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        width: 195,
                        height: 50,
                        child: const SearchBar(
                          hintText: "Recherche...",
                          elevation: MaterialStatePropertyAll(0),

                        ),
                      ),
                  SizedBox(width: 15,),
                  Container(
                    decoration: BoxDecoration(
                      border: const Border(
                        top: BorderSide(color: Colors.green, width: 2),
                        bottom: BorderSide(color: Colors.green, width: 2),
                        right: BorderSide(color: Colors.green, width: 2),
                        left: BorderSide(color: Colors.green, width: 2),
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child:  TextButton(onPressed: ()=>{},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.add_circle_outline,color: Colors.green,size: 25,),
                            SizedBox(width: 10,),
                            Text("Nouvelle ferme",style: TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),)
                          ],
                        )),
                  )
                    ],
                  )
                ),

                //:::::::::::::::::::::::::::::::::::::::::::::::: LES PRODUITS :::::::::::::::::::::::::::::::::::::::
                FermeItems(),
              ],
            ),
          )
        ],
      ),
      //  bottomNavigationBar: bottomBar(),
    );
  }
}
