import 'package:flutter/material.dart';
import '../PackagesContenues/formationItems.dart';
import '../PackagesContenues/formationSlider.dart';

class formationPage extends StatelessWidget {
  const formationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "My Farmed",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "cardpage");
                          },
                          child:  const Icon(
                            Icons.add_shopping_cart_outlined,
                            size: 30,
                            color: Colors.green,
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.notification_add_outlined,
                        size: 30,
                        color: Colors.green,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
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

                 padding: EdgeInsets.all(10),
                  child: FormationSlider(),
                ),


                //::::::::::::::::::::::::::::::::::: TEXT PRODUITS :::::::::::::::::::::::::::::::::::::

                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Formation réssantes",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 20),
                  ),
                ),

                //:::::::::::::::::::::::::::::::::::::::::::::::: LES PRODUITS :::::::::::::::::::::::::::::::::::::::
                FormationItems(),
              ],
            ),
          )
        ],
      ),
    //  bottomNavigationBar: bottomBar(),
    );
  }
}
