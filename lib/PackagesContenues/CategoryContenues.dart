import 'package:flutter/material.dart';

class CategoryContenues extends StatelessWidget {
  const CategoryContenues({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(

        children: [
          for(int i = 1; i < 5; i++)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 2.0,
                      spreadRadius: .05
                  )
                ]
            ),
            child: Row(
              children: [
                Image.asset("assets/images/$i.jpg",width: 40,height: 40,),
                const Text("Poulets",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.green
                ),)
              ],
            ),

          )
        ],
      ),
    );
  }
}
