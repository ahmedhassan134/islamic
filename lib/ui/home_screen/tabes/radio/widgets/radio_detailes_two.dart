import 'package:flutter/material.dart';

import '../../../../../core/models/radio_model.dart';
import '../../../../../core/utiles/app_assets.dart';
import '../../../../../core/utiles/app_colors.dart';
import '../../../../../core/utiles/helper.dart';
class RadioDetailesTwo extends StatelessWidget {
  const RadioDetailesTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              margin: EdgeInsets.all(16),
              width: double.infinity,
              height: Helper.screenHeight * .2,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(

                  image: AssetImage("assets/images/Mosque-02.png"),

                  fit: BoxFit.fill,

                ),
              ),
              child: Column(
                spacing: Helper.screenHeight * .04,
                crossAxisAlignment: .center,
                children: [
                  Text(
                    RadioModel.radioDetailes2[index].text,
                    style: Helper.bold20Black,
                  ),
                  Row(
                    mainAxisAlignment: .center,
                    spacing: 16,
                    children: [
                      Image.asset(RadioModel.radioDetailes2[index].imag1),
                      Image.asset(RadioModel.radioDetailes2[index].imag2),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox();
      },
      itemCount: RadioModel.radioDetailes2.length,
    );
  }
}
