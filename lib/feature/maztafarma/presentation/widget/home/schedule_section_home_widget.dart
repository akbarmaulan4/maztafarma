import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maztafarma/core/constant/color_constant.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/task/e_task.dart';
import 'package:maztafarma/feature/maztafarma/presentation/page/task/detail_task_checkin.dart';
import 'package:maztafarma/feature/maztafarma/presentation/page/task/detail_task_page.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/task/task_list_tile_widget.dart';

import '../app_text.dart';

class ScheduleSectionHomeWidget extends StatelessWidget {
  String? title;
  List<ETask>? data = [];
  ScheduleSectionHomeWidget({this.title, this.data, super.key});

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
              Text(title ?? '', style: GoogleFonts.rubik().copyWith(fontSize: 16, fontWeight: FontWeight.w600),),
              Text('View All', style: GoogleFonts.rubik().copyWith(fontSize: 14, color: greenPrimaryColor),),
            ],
          ),
          SizedBox(height: 15),
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: data!.map((e) => TaskListTileWidget(
                  data: e,
                  onClick: (val)=>Get.to(()=>DetailTaskCheckin(data: val,)),
                )).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
