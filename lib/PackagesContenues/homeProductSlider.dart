import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';




class HomeProductSlider extends StatefulWidget {
  const HomeProductSlider({Key? key}) : super(key: key);

  @override
  State<HomeProductSlider> createState() => _HomeProductSlider();
}

class _HomeProductSlider extends State<HomeProductSlider> {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/1.jpg'},
    {"id": 2, "image_path": 'assets/images/2.jpg'},
    {"id": 3, "image_path": 'assets/images/3.jpg'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(int i = 1; i < 5; i++)
            Container(
              padding: EdgeInsets.only(left: 15,right: 15,top: 10),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              width: 210,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 2.0,
                        spreadRadius: .05
                    )
                  ]
              ),
              child: Column(
                children: [

                  Row(

                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 2.0,
                                  spreadRadius: .05
                              )
                            ]
                        ),
                        child:const Text("-50%",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      ),
                      SizedBox(width: 110,),
                      Icon(Icons.favorite_border,color: Colors.redAccent,)
                    ],
                  ),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      margin: EdgeInsets.all(1),
                      child: Image.asset("assets/images/$i.jpg",height: 120,width: 120,),
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
                    child: Text("Ceci est une petite description du produits",style: TextStyle(fontSize: 15),),

                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("55OO Fcfa",style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.green),
                        ),
                        SizedBox(width: 50,),
                        Icon(Icons.shopping_cart_checkout,color: Colors.green,)
                      ],
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );

  }
}
