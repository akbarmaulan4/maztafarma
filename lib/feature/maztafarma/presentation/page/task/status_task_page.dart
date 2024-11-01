import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:maztafarma/core/constant/box_style_constant.dart';
import 'package:maztafarma/core/constant/color_constant.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/app_bar_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/app_search_filter_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/app_search_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/task/task_list_tile_widget.dart';

import 'detail_task_page.dart';

class StatusTaskPage extends StatelessWidget {
  const StatusTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(title: 'Complete Task', onBackPressed: ()=>Get.back(),),
            Expanded(
              child: ListView(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: AppSearchFilterWidget()
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.calendar_today, color: bluePrimaryColor, size: 30,),
                        SizedBox(width: 15),
                        Text('${DateFormat("MMMM").format(DateTime.now())}',  style: GoogleFonts.rubik().copyWith(fontSize: 20, fontWeight: FontWeight.w600),)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('26 Sept 2024', style: GoogleFonts.rubik().copyWith(fontSize: 16)),
                        SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [1,2,3].map((e) => Container(
                              child: scheduleItemTile(),
                            )).toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('25 Sept 2024', style: GoogleFonts.rubik().copyWith(fontSize: 16)),
                        SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [1,2,3].map((e) => Container(
                              child: scheduleItemTile(),
                            )).toList(),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  scheduleItemTile(){
    return GestureDetector(
      onTap: ()=>Get.to(()=>DetailTaskPage()),
      child: Container(
        decoration: BoxStyleConstant.boxShadowButon(
          radius: 15,
          blurRadius: 4,
          color: Color(0xFF6256CA).withOpacity(0.2),
          spreadRadius: 2,
          colorShadow: Colors.grey.shade200,
          offset: Offset(1, 4),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: EdgeInsets.symmetric(horizontal: 3),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: [
                Container(
                  height: 35,
                  width: 3,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxStyleConstant.boxButton(color: bluePrimaryColor, radius: 25),
                ),

                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Cleaning Clotes', style: GoogleFonts.rubik().copyWith(fontSize: 16, fontWeight: FontWeight.w600),),
                    SizedBox(height: 4),
                    Text('07:00 - 19:00', style: TextStyle(fontSize: 14)),
                    SizedBox(height: 18),
                    Row(
                      children: [
                        Container(
                          decoration: BoxStyleConstant.boxButton(color: bluePrimaryColor.withOpacity(0.5), radius: 10),
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Center(
                            child: Text('Urgent', style: GoogleFonts.rubik().copyWith(fontSize: 14, color: Colors.white)),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          decoration: BoxStyleConstant.boxButton(color: bluePrimaryColor.withOpacity(0.5), radius: 10),
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Center(
                            child: Text('Ignore', style: GoogleFonts.rubik().copyWith(fontSize: 14, color: Colors.white)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Icon(CupertinoIcons.ellipsis_vertical, color: Colors.white,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
