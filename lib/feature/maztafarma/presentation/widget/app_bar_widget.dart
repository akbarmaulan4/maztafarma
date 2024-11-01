import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maztafarma/core/constant/box_style_constant.dart';
import 'package:maztafarma/core/constant/color_constant.dart';

class AppBarWidget extends StatelessWidget {
  String? title;
  Function? onBackPressed;
  AppBarWidget({this.title, this.onBackPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          GestureDetector(
            onTap: ()=>onBackPressed!(),
            child: Container(
              decoration: BoxStyleConstant.boxShadowButon(
                  color: Colors.white, radius: 15,
                  blurRadius: 4,
                  spreadRadius: 2,
                  colorShadow: Colors.grey.shade200,
                  offset: Offset(1, 4)
              ),
              child: Icon(CupertinoIcons.chevron_back),
              padding: EdgeInsets.all(13),
            ),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(right: 25),
                child: Text(title ?? '',  style: GoogleFonts.rubik().copyWith(color: bluePrimaryColor, fontSize: 20, fontWeight: FontWeight.w600),)
            ),
          )
        ],
      ),
    );
  }
}
