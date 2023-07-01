import 'package:flutter/material.dart';

class forumPage extends StatelessWidget {
  const forumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text("Forum"),
          backgroundColor: Colors.green,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 15),
            decoration:  BoxDecoration(
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
                        Icons.keyboard_voice,
                        size: 27,
                        color: Colors.green,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      for(int i=1;i<10;i++)
                      Container(
                        height: 180,
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                            border: const Border(
                              top: BorderSide(color: Colors.green, width: 2),
                              bottom: BorderSide(color: Colors.green, width: 2),
                              right: BorderSide(color: Colors.green, width: 2),
                              left: BorderSide(color: Colors.green, width: 2),
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 2.0,
                                  spreadRadius: .05
                              )
                            ],
                        color: Colors.white),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    border: const Border(
                                      top: BorderSide(color: Colors.green, width: 2),
                                      bottom: BorderSide(color: Colors.green, width: 2),
                                      right: BorderSide(color: Colors.green, width: 2),
                                      left: BorderSide(color: Colors.green, width: 2),
                                    ),
                                    borderRadius: BorderRadius.circular(100),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.5),
                                            blurRadius: 2.0,
                                            spreadRadius: .05
                                        )
                                      ]
                                  ),
                                  child: const CircleAvatar(
                                    backgroundImage: AssetImage(
                                      "assets/images/logo.png",
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  width: 265,
                                  child: const Text(
                                    "Ceci est le titre d'un forum de test pour bien voir la longueur de mon text.Comment devenir riche dans l'aviculture ?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                    color: Colors.black87),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: const Text(
                                    "Par: COULIBALY Adama le 03/07/20 à 12:29",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: const Center(
                                          child: Text(
                                            "100",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        "Commentaire(s)",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 5,left: 5),
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20)
                                    )
                                  ),
                                  child: TextButton(
                                      onPressed: () => {

                                      },
                                      child: const Text(
                                        "Voir plus",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.white),
                                      )),
                                ),
                                
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),

              ],
            ),
          ),
          

        ),
      ),
    );
  }
}
