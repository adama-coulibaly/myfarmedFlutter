import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartSamplesItems extends StatelessWidget {
  const CartSamplesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(int i=1; i<15;i++)
        Container(
          height: 110,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(

            children: [

              Radio(
                value: "",
                groupValue: "",
                onChanged: (index) {},
                activeColor: Colors.green,
              ),
              Container(
                height: 70,
                width: 70,
                margin: EdgeInsets.only(right: 5),
                child: Image.asset("assets/images/1.jpg"),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Titre de produit",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 18),
                    ),
                    Text(
                      "\$55",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 10)
                              ]),
                          child:
                          const Icon(CupertinoIcons.plus,
                          size: 18,),
                        ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: const Text("01",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 16
                  ),),
                ),

                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 10)
                              ]),
                          child:
                          const Icon(CupertinoIcons.minus,
                            size: 18,),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
