import 'package:flutter/material.dart';

class ShopTopBar extends StatelessWidget {
  const ShopTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Container(
      height: 110,
      color: Colors.green,
      padding: EdgeInsets.only(left: 10,right: 10,top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "My Farmed",
            style: TextStyle(
                color: Colors.white,
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
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.notification_add_outlined,
                  size: 30,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
