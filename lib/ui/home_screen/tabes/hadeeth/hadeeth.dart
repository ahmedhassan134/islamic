import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islamic/core/utiles/helper.dart';
import 'package:islamic/ui/home_screen/tabes/hadeeth/widget/hadeeth_content.dart';
class Hadeeth extends StatelessWidget {
  const Hadeeth({super.key});

  @override
  Widget build(BuildContext context) {
    Helper.init(context);
    return CarouselSlider(
      options: CarouselOptions(
        height: Helper.screenHeight * .6,
        enlargeCenterPage: true,
        viewportFraction: 1,
      ),
      items: List.generate(50, (index) => index + 1).map((i) {
        return Builder(
          builder: (BuildContext context) {

            return HadeethContent(index: i);
          },
        );
      }).toList(),
    );
  }
}
