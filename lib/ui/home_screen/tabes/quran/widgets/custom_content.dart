import 'package:flutter/material.dart';

import '../../../../../core/utiles/app_colors.dart';
import '../../../../../core/utiles/helper.dart';
class CustomContent extends StatefulWidget {
   CustomContent({required this.content,required this.index});
final String content;
final int index;

  @override
  State<CustomContent> createState() => _CustomContentState();
}

class _CustomContentState extends State<CustomContent> {
bool isClicked=false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        isClicked=!isClicked;
        setState(() {

        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24),
        margin: EdgeInsets.symmetric(horizontal: 16),
        // width: double.infinity,
        height: Helper.screenHeight*.1,
        decoration: BoxDecoration(
          color:isClicked? AppColors.primaryColor:Colors.transparent ,
           border: Border.all(
             color:isClicked? AppColors.primaryColor:AppColors.whiteColor,
             width: 2
           ),
            borderRadius: BorderRadius.circular(16)
        ),
        child: Text(
          textAlign: TextAlign.center,
        "${widget.content} [ ${widget.index+1} ]",
          style: Helper.bold20White,
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
