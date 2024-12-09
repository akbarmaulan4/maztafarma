import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maztafarma/core/constant/box_style_constant.dart';
import 'package:maztafarma/core/constant/color_constant.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/task/e_task.dart';
import 'package:maztafarma/feature/maztafarma/presentation/page/task/detail_task_page.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/app_empty_task_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/task/task_list_tile_widget.dart';

class TodayTaskWidget extends StatelessWidget {
  List<ETask>? data = [];
  TodayTaskWidget({this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Today', style: GoogleFonts.rubik().copyWith(fontSize: 20, fontWeight: FontWeight.w600)),
              // Text('09 h 45 min', style: GoogleFonts.rubik().copyWith(fontSize: 16)),
            ],
          ),
          Divider(),
          SizedBox(height: 20),
          data!.length > 0 ? Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index){
                  return TaskListTileWidget(
                    data: data![index],
                  );
                },
              ),
            ),
          ):AppEmptyTaskWidget()

          // noScheduleItem(),
          // noScheduleItem(),
          // scheduleItem(),
          // noScheduleItem(),
          // noScheduleItem(),
          // scheduleItem(),
          // noScheduleItem(),
          // scheduleItem(),
        ],
      ),
    );
  }

  // noScheduleItem(){
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 5),
  //     child: Column(
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text('07:00', style: GoogleFonts.rubik().copyWith(fontSize: 16)),
  //             Text('You don\'t have any schedule', style: GoogleFonts.rubik().copyWith(fontSize: 16, color: Colors.black26)),
  //             Text('+ Add', style: GoogleFonts.rubik().copyWith(fontSize: 16))
  //           ],
  //         ),
  //         SizedBox(height: 10),
  //         Divider(),
  //       ],
  //     ),
  //   );
  // }

  // scheduleItem(){
  //   return Container(
  //     child: Column(
  //       children: [
  //         Row(
  //           children: [
  //             Text('09:00', style: GoogleFonts.rubik().copyWith(fontSize: 16)),
  //             SizedBox(width: 20,),
  //             Expanded(
  //               child: SingleChildScrollView(
  //                 scrollDirection: Axis.horizontal,
  //                 child: Row(
  //                   children: [1,2,3].map((e) => Container(
  //                     child: scheduleItemTile(),
  //                   )).toList(),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //         SizedBox(height: 10),
  //         Divider()
  //       ],
  //     ),
  //   );
  // }
  //
  // scheduleItemTile(){
  //   return GestureDetector(
  //     onTap: ()=>Get.to(()=>DetailTaskPage()),
  //     child: Container(
  //       decoration: BoxStyleConstant.boxShadowButon(
  //         radius: 15,
  //         blurRadius: 4,
  //         color: Color(0xFF6256CA).withOpacity(0.2),
  //         spreadRadius: 2,
  //         colorShadow: Colors.grey.shade200,
  //         offset: Offset(1, 4),
  //       ),
  //       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  //       margin: EdgeInsets.symmetric(horizontal: 3),
  //       child: Column(
  //         children: [
  //           Row(
  //             crossAxisAlignment: CrossAxisAlignment.baseline,
  //             textBaseline: TextBaseline.ideographic,
  //             children: [
  //               Container(
  //                 height: 35,
  //                 width: 3,
  //                 margin: EdgeInsets.only(top: 10),
  //                 decoration: BoxStyleConstant.boxButton(color: bluePrimaryColor, radius: 25),
  //               ),
  //
  //               SizedBox(width: 15),
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text('Cleaning Clotes', style: GoogleFonts.rubik().copyWith(fontSize: 16, fontWeight: FontWeight.w600),),
  //                   SizedBox(height: 4),
  //                   Text('07:00 - 19:00', style: TextStyle(fontSize: 14)),
  //                   SizedBox(height: 18),
  //                   Row(
  //                     children: [
  //                       Container(
  //                         decoration: BoxStyleConstant.boxButton(color: bluePrimaryColor.withOpacity(0.5), radius: 10),
  //                         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
  //                         child: Center(
  //                           child: Text('Urgent', style: GoogleFonts.rubik().copyWith(fontSize: 14, color: Colors.white)),
  //                         ),
  //                       ),
  //                       SizedBox(width: 10,),
  //                       Container(
  //                         decoration: BoxStyleConstant.boxButton(color: bluePrimaryColor.withOpacity(0.5), radius: 10),
  //                         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
  //                         child: Center(
  //                           child: Text('Ignore', style: GoogleFonts.rubik().copyWith(fontSize: 14, color: Colors.white)),
  //                         ),
  //                       )
  //                     ],
  //                   )
  //                 ],
  //               ),
  //               Icon(CupertinoIcons.ellipsis_vertical, color: Colors.white,)
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

}
