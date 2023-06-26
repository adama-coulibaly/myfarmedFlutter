import 'package:flutter/material.dart';

class Shopproducts extends StatelessWidget {
  const Shopproducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
    shrinkWrap: true,
    childAspectRatio: 0.68,
    children: [
      for(int i = 1; i < 5; i++)
      Container(
        padding: EdgeInsets.only(left: 15,right: 15,top: 10),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
      Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20)
        ),
        child:const Text("-50%",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        ),
      ),
                Icon(Icons.favorite_border,color: Colors.redAccent,)
              ],
            ),
            InkWell(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.all(5),
                child: Image.asset("assets/images/$i.jpg",height: 110,width: 110,),
              ),
            ),
            Container(
                padding: EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
              child: const Text("Titre du produits",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontSize: 15
              ),),
             ),

            Container(
              alignment: Alignment.centerLeft,
              child: Text("Ceci est une petite description",style: TextStyle(fontSize: 15),),
              
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
        Text("55OO Fcfa",style: TextStyle(fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.green),
        ),
                  Icon(Icons.shopping_cart_checkout,color: Colors.green,)
                ],
              ),
            )
          ],
        ),
      )
    ],);

  }
}
