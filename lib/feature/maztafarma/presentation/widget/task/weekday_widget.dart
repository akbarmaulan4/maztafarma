import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maztafarma/core/constant/box_style_constant.dart';
import 'package:maztafarma/core/constant/color_constant.dart';
import 'package:maztafarma/feature/maztafarma/presentation/controller/task/task_controller.dart';

class WeekdayWidget extends StatelessWidget {
  Function? onDateClicked;
  WeekdayWidget({this.onDateClicked, super.key});

  @override
  Widget build(BuildContext context) {
    TaskController controller = Get.find();
    controller.getDayInWeek();
    return Obx(() => Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Task', style: GoogleFonts.rubik().copyWith(fontSize: 20, fontWeight: FontWeight.w600)),
              Container(
                child: Row(
                  children: [
                    Icon(CupertinoIcons.calendar, size: 17,),
                    Text(controller.currentMonth.value, style: GoogleFonts.rubik().copyWith(color: Colors.grey.shade400, fontSize: 14, fontWeight: FontWeight.w600)),
                    SizedBox(width: 10),
                    Text('${DateTime.now().year}', style: GoogleFonts.rubik().copyWith(color: Colors.grey.shade400, fontSize: 14, fontWeight: FontWeight.w600)),
                  ],
                ),
              )
            ],
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.dateOfTheWeek.map((element) => GestureDetector(
                  onTap: ()=>onDateClicked!(element),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxStyleConstant.boxButton(
                        radius: 15, color: element.currentDate ? bluePrimaryColor:Colors.transparent
                    ),
                    child: Column(
                      children: [
                        Text(element.name, style: GoogleFonts.rubik().copyWith(color: element.currentDate ? Colors.white:Colors.grey.shade400, fontSize: 14, fontWeight: FontWeight.w600)),
                        SizedBox(height: 10),
                        Text(element.date.toString(), style: GoogleFonts.rubik().copyWith(color: element.currentDate ? Colors.white:Colors.grey.shade400, fontSize: 14))
                      ],
                    ),
                  ),
                )).toList(),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
