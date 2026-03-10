import 'package:flutter/material.dart';
import 'package:islamic/core/utiles/app_colors.dart';
import 'package:islamic/core/utiles/helper.dart';

class Sebha extends StatefulWidget {
   Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
List<String> wordChange=["سبحان الله","الحمد لله","الله أكبر"];

int counter=0;

int cIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackyColor.withAlpha(30),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              style: Helper.bold20White.copyWith(
                fontSize: 36
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
            Stack(
              alignment: .center,
              children: [
                GestureDetector(
                  onTap: tasbeeh,
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset("assets/images/seb_image.png"),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: Helper.screenHeight*.06),
                  child: Column(

                    children: [
                     Text("${wordChange[cIndex]}",style: Helper.bold20White.copyWith(
                          fontSize: 36
                      ),),
                      Text("$counter",style: Helper.bold20White.copyWith(
                          fontSize: 36
                      ),),

                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );

  }

double angle = 0;

void tasbeeh() {
  setState(() {


    angle += 0.1;


    counter++;

    if (counter == 33) {
      counter = 0;
      cIndex = (cIndex + 1) % wordChange.length;
    }

  });
}
}
