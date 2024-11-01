import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maztafarma/core/constant/box_style_constant.dart';

class AppSearchWidget extends StatelessWidget {
  const AppSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxStyleConstant.boxButton(
        radius: 16, color: Colors.grey.shade200,
      ),
      margin: EdgeInsets.symmetric(horizontal: 6),
      padding: EdgeInsets.only(right: 15),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 25, top: 12),
            prefixIcon: Icon(CupertinoIcons.search, size: 20, color: Colors.grey),
            suffixIcon: Icon(CupertinoIcons.xmark_octagon_fill, color: Colors.grey, size: 18,),
            hintText: 'Search Task here...',
            hintStyle:  GoogleFonts.rubik().copyWith(color: Colors.grey.shade400, fontSize: 14)
          ),
        ),
      ),
    );
  }
}
