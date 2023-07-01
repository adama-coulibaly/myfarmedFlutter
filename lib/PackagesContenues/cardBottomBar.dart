import 'package:flutter/material.dart';


class cardBottomBar extends StatelessWidget {
  const cardBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BottomAppBar(
      elevation: 100,

child: Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.green
  ),
  height: 120,
  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
  child:  Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Total",style: TextStyle(fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white),),
          Text("100.000 Fcfa",style: TextStyle(fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white),)
        ],
      ),
      Container(
        alignment: Alignment.center,
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: TextButton(onPressed: ()=>{},
            child: Text("Commander",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.green
            ),),)
      )
    ],
  ),
),
    );
  }
}
