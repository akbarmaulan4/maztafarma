import 'package:flutter/material.dart';
import 'package:maztafarma/core/constant/box_style_constant.dart';
import 'package:maztafarma/core/constant/color_constant.dart';
import 'package:maztafarma/core/theme/typography.dart';

class ButtonAppWidget extends StatelessWidget {
  String? title;
  Function? onPressed;
  ButtonAppWidget({this.title, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onPressed!(),
      child: Container(
        decoration: BoxStyleConstant.boxButton(
            color: greenPrimaryColor,
            radius: 15
        ),
        width: double.infinity,
        height: 50,
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
        margin: EdgeInsets.all(10),
        child: Center(child: Text(title??'', style: mButtonTitle.copyWith(color: Colors.white))),
      ),
    );
  }
}
