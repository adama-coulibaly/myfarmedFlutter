import 'package:flutter/material.dart';

import '../PackagesContenues/bottomBar.dart';
import '../PackagesContenues/homeFormationItems.dart';
import '../PackagesContenues/homeProductSlider.dart';
import '../PackagesContenues/homeSlider.dart';
import '../PackagesContenues/topbar.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        appBar: AppBar(
          flexibleSpace: topAppBar(),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 15),

          child: Container(
            padding: EdgeInsets.only(top: 15),

            decoration: const BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                )),

            child: Column(

              children: [
                const SizedBox(
                  height: 10,
                ),

                Container(
                  padding: EdgeInsets.all(10),

                  child:  SliderBody(),
                ),

                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for(int i = 1; i < 5; i++)
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        padding: EdgeInsets.all(3),
                        child: Column(
                          children: [
                            Container(
                              child: const Icon(
                                Icons.favorite,
                                size: 45,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              child: const Text(
                                "J'aimes",
                                style:
                                TextStyle(fontSize: 15, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Center(
                  child: SizedBox(
                      height: 10,
                      width: 100,
                      child: Card(
                        color: Colors.green,
                      )),
                ),
                Container(
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              height: 180,
                              width: 150,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Image.asset(
                                "assets/images/3.jpg",
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: const Text(
                                      "Espace fermier",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 15,),

                                  Container(
                                    child: const Text(
                                      "Vous pouvez gérer vos champs\n ici en suivant vos productions \n partout ou vous etes"
                                          " en  créant \n simplement un compte.",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,

                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15,),

                                  Container(
                                    height: 50,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: TextButton(onPressed: () => {},
                                        child: Text("Ferme",style: TextStyle(
                                          fontSize: 25, color: Colors.white,fontWeight: FontWeight.bold
                                        ),),
                                        style: ButtonStyle(

                                        )),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ), SizedBox(height: 10,),

                //::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: DEVIDER PRODUITS :::::::::::::::::::::::::::::
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(
                        children: [
                          Container(
                            height:45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child:   Icon(Icons.shopping_cart_outlined,size: 30, color: Colors.white,),
                          ),
                          SizedBox(width: 15,),

                          Container(
                            child: const Text("Produits",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,
                                fontSize: 20),),
                          )
                        ],
                      ),

                      InkWell(
                        onTap: ()=>{
                          Navigator.pushNamed(context, "shoppingpage")
                        },

                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                          ),

                          child: const Text("Voir plus",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                            color: Colors.green,),),
                        ),
                      )

                    ],
                  ),
                ),
                SizedBox(height: 10,),
                HomeProductSlider(),
                SizedBox(height: 10,),
                //::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: DEVIDER FORMATION :::::::::::::::::::::::::::::
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Row(
                          children: [
                            Container(
                              height:45,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child:   Icon(Icons.school_outlined,size: 30, color: Colors.white,),
                            ),
                            SizedBox(width: 15,),

                            Container(
                              child: const Text("Formations",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                            )
                          ],
                        ),

                        InkWell(
                          onTap: ()=>{
                            Navigator.pushNamed(context, "formationPage")
                          },

                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                            ),

                            child: const Text("Voir plus",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                            color: Colors.green,),),
                          ),
                        )

                    ],
                  ),
                ),

                SizedBox(height: 10,),

                HomeformationItems(),
              ],
            ),
          )
        ),
        bottomNavigationBar: Container(
          child: bottomBar(),
        ),
      ),

    );
  }
}
