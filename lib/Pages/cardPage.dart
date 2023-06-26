import 'package:flutter/material.dart';

import '../PackagesContenues/CartAppBar.dart';
import '../PackagesContenues/CartSamplesItems.dart';

class cardPage extends StatelessWidget {
  const cardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body: ListView(
       //physics: const NeverScrollableScrollPhysics(),
       children: [
         CartAppBar(),


         Container(
         //  height: 700,
           padding: EdgeInsets.only(top: 30),
           decoration: const BoxDecoration(
               color: Color(0xFFEDECF2),
               borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(35),
                 topRight: Radius.circular(35),
               )),
           child:
           Column(
             children: [
               CartSamplesItems()
             ],
           ),
         )
       ],
     ),
    );
  }
}
