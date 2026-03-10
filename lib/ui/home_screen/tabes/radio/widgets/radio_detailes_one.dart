import 'package:flutter/material.dart';
import 'package:islamic/core/models/radio_model.dart';
import 'package:islamic/core/utiles/app_assets.dart';
import 'package:islamic/core/utiles/app_colors.dart';
import 'package:islamic/core/utiles/helper.dart';

class RadioDetailesOne extends StatelessWidget {
  const RadioDetailesOne({super.key});

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
                    RadioModel.radioDetailes1[index].text,
                    style: Helper.bold20Black,
                  ),
                  Row(
                    mainAxisAlignment: .center,
                    spacing: 16,
                    children: [
                      Image.asset(RadioModel.radioDetailes1[index].imag1),
                      Image.asset(RadioModel.radioDetailes1[index].imag2),
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
      itemCount: RadioModel.radioDetailes1.length,
    );
  }
}
