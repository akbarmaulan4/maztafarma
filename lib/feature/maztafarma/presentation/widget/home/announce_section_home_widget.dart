import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maztafarma/core/constant/box_style_constant.dart';
import 'dart:math' as math;

import 'package:maztafarma/core/constant/color_constant.dart';

class AnnounceSectionHomeWidget extends StatelessWidget {
  const AnnounceSectionHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Announcement', style: GoogleFonts.rubik().copyWith(fontSize: 16, fontWeight: FontWeight.w600),),
              Text('View All', style: GoogleFonts.rubik().copyWith(fontSize: 14, color: greenPrimaryColor),),
            ],
          ),
          Container(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index){
                return Container(
                  width: 250,
                  decoration: BoxStyleConstant.boxShadowButon(
                    radius: 15,
                    blurRadius: 4,
                    color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                    spreadRadius: 2,
                    colorShadow: Colors.grey.shade200,
                    offset: Offset(1, 4),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pengumuman', style: GoogleFonts.rubik().copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),),
                      Text('Ini merupakan contoh dari pengumunan yang akan ditampilkan oleh sistem', style: GoogleFonts.rubik().copyWith(fontSize: 15, color: Colors.white)),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
