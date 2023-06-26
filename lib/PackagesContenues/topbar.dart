import 'package:flutter/material.dart';

class topAppBar extends StatefulWidget {
  const topAppBar({Key? key}) : super(key: key);

  @override
  State<topAppBar> createState() => _topAppBarState();
}

class _topAppBarState extends State<topAppBar> {
  @override
  Widget build(BuildContext context) {
    return    Container(
        height: 100,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 60,
              width: 60,
              child: const CircleAvatar(
                backgroundColor: Colors.grey,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      Icons.notification_add_outlined,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      Icons.add_shopping_cart_outlined,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      Icons.wind_power,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
