import 'package:flutter/material.dart';

class FermeItems extends StatelessWidget {
  const FermeItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 0.68,
      children: [
        for (int i = 1; i < 5; i++)
          Container(

            padding: const EdgeInsets.only(left: 1, right: 1,),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: const Border(
                top: BorderSide(color: Colors.green, width: 2),
                bottom: BorderSide(color: Colors.green, width: 2),
                right: BorderSide(color: Colors.green, width: 2),
                left: BorderSide(color: Colors.green, width: 2),
              ),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    child: Image.asset(
                      "assets/images/$i.jpg",
                      height: 150,
                      width: 150,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  alignment: Alignment.center,
                  child: const Text(
                    "Nom de la ferme plus longue",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18),
                  ),
                ),
                Container(
                  width: 120,

                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),

                  ),

                  child: TextButton(
                      onPressed: () => {},
                      style: ButtonStyle(),
                      child: const Text(
                        "Voir plus",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          )
      ],
    );
  }
}
