import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maztafarma/core/constant/box_style_constant.dart';
import 'package:maztafarma/core/constant/color_constant.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/task/e_task.dart';

class TaskListTileWidget extends StatelessWidget {
  ETask? data;
  Function? onClick;
  TaskListTileWidget({this.data, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onClick!(data!),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxStyleConstant.boxShadowButon(
          radius: 15,
          blurRadius: 4,
          color: Color(0xFF6256CA).withOpacity(0.2),
          spreadRadius: 2,
          colorShadow: Colors.grey.shade200,
          offset: Offset(1, 4),
        ),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data != null ? data!.nama_product! : '', style: GoogleFonts.rubik().copyWith(fontSize: 16, fontWeight: FontWeight.w600),),
                      SizedBox(height: 7),
                      Text('07:00 - 19:00', style: TextStyle(fontSize: 14)),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Container(
                            decoration: BoxStyleConstant.boxButton(color: bluePrimaryColor.withOpacity(0.5), radius: 10),
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Text('Urgent', style: GoogleFonts.rubik().copyWith(fontSize: 14, color: Colors.white)),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            decoration: BoxStyleConstant.boxButton(color: bluePrimaryColor.withOpacity(0.5), radius: 10),
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Text('Ignore', style: GoogleFonts.rubik().copyWith(fontSize: 14, color: Colors.white)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
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
