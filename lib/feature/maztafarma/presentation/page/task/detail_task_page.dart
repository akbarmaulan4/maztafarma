import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maztafarma/core/constant/box_style_constant.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/task/e_task.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/app_bar_widget.dart';
import 'dart:math' as math;


class DetailTaskPage extends StatelessWidget {
  ETask? data;
  DetailTaskPage({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            AppBarWidget(title: 'Detail', onBackPressed: ()=>Get.back(),),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Plan for a month', style: GoogleFonts.rubik().copyWith(fontSize: 25, fontWeight: FontWeight.w600)),
                  SizedBox(height: 20),
                  Text('Personal type', style: GoogleFonts.rubik().copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black26)),
                ],
              )
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    decoration: BoxStyleConstant.boxShadowButon(
                      color: Colors.deepOrange.shade400, radius: 15,
                      blurRadius: 4,
                      spreadRadius: 2,
                      colorShadow: Colors.grey.shade200,
                      offset: Offset(1, 4)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Est. Date', style: GoogleFonts.rubik().copyWith(fontSize: 16, color: Colors.white)),
                        SizedBox(height: 10),
                        Text('4 August 2024', style: GoogleFonts.rubik().copyWith(fontSize: 20, color: Colors.white)),
                      ],
                    ),
                  )),
                  SizedBox(width: 15),
                  Expanded(child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    decoration: BoxStyleConstant.boxShadowButon(
                        color: Colors.deepOrange.shade400, radius: 15,
                        blurRadius: 4,
                        spreadRadius: 2,
                        colorShadow: Colors.grey.shade200,
                        offset: Offset(1, 4)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Est. Time', style: GoogleFonts.rubik().copyWith(fontSize: 16, color: Colors.white)),
                        SizedBox(height: 10),
                        Text('07:00-09:00', style: GoogleFonts.rubik().copyWith(fontSize: 20, color: Colors.white)),
                      ],
                    ),
                  )),
                ],
              ),
            ),

            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Task', style: GoogleFonts.rubik().copyWith(fontSize: 25, fontWeight: FontWeight.w600)),
                  Column(
                    children: [1,2,3,4].map((e) => Row(
                      children: [
                        Transform.scale(
                          scale: 1.3,
                          child: Checkbox(
                            value: true,
                            onChanged: (val){},
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text('Creating this month\'s work plan', style: GoogleFonts.rubik().copyWith(fontSize: 16, fontWeight: FontWeight.w600),),
                              Divider(color: Colors.black12,)
                            ],
                          ),
                        ),
                      ],
                    )).toList(),
                  )
                ],
              ),
            ),

            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tags', style: GoogleFonts.rubik().copyWith(fontSize: 25, fontWeight: FontWeight.w600)),
                  SizedBox(height: 15),
                  Container(
                    child: Row(
                      children: ['Office', 'Home', 'Urgent', 'Work'].map((e) => Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(e, style: GoogleFonts.rubik().copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),),
                        decoration: BoxStyleConstant.boxButton(radius: 15, color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)
                        ),
                      )).toList(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
