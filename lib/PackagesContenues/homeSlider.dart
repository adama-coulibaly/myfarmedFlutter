import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';




class SliderBody extends StatefulWidget {
  const SliderBody({Key? key}) : super(key: key);

  @override
  State<SliderBody> createState() => _HomeSlide();
}

class _HomeSlide extends State<SliderBody> {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/1.jpg'},
    {"id": 2, "image_path": 'assets/images/2.jpg'},
    {"id": 3, "image_path": 'assets/images/3.jpg'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(

          children: [

        Stack(
          children: [
            InkWell(
              onTap: () {

              },
              child: CarouselSlider(

                items: imageList
                    .map(
                      (item) => Image.asset(
                    item['image_path'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(

                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentIndex == entry.key ? 17 : 7,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == entry.key
                              ? Colors.red
                              : Colors.teal),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ]);

  }
}
