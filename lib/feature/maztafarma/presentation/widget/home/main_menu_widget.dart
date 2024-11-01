import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maztafarma/core/constant/box_style_constant.dart';
import 'package:maztafarma/core/constant/color_constant.dart';
import 'package:maztafarma/core/constant/image_constant.dart';

class MainMenuWidget extends StatelessWidget {
  List<Map> data;
  MainMenuWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Task', style: GoogleFonts.rubik().copyWith(fontSize: 25, fontWeight: FontWeight.w600)),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 170,
                        width: double.maxFinite,
                        decoration: BoxStyleConstant.boxShadowButon(
                          radius: 8,
                          blurRadius: 2,
                          color: Color(0xFFC4D7FF),
                          spreadRadius: 1,
                          colorShadow: Colors.grey.shade400,
                          offset: Offset(1, 4),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: Image.asset(icMonitor3d, height: 85, width: 85,)),
                            SizedBox(height: 15),
                            Text('Completed', style: GoogleFonts.rubik().copyWith(color: bluePrimaryColor,fontSize: 15, fontWeight: FontWeight.w600)),
                            SizedBox(height: 10),
                            Text('86 Task', style: GoogleFonts.rubik().copyWith(color: bluePrimaryColor,fontSize: 14)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 110,
                        width: double.maxFinite,
                        decoration: BoxStyleConstant.boxShadowButon(
                          radius: 8,
                          blurRadius: 2,
                          color: Color(0xFFFF8A8A),
                          spreadRadius: 1,
                          colorShadow: Colors.grey.shade400,
                          offset: Offset(1, 4),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(CupertinoIcons.delete_right, color: Colors.white,),
                            SizedBox(height: 15),
                            Text('Completed', style: GoogleFonts.rubik().copyWith(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w600)),
                            SizedBox(height: 10),
                            Text('86 Task', style: GoogleFonts.rubik().copyWith(color: Colors.white,fontSize: 14)),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ),
              SizedBox(width: 20),
              Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          height: 110,
                          width: double.maxFinite,
                          decoration: BoxStyleConstant.boxShadowButon(
                            radius: 8,
                            blurRadius: 2,
                            color: Color(0xFF87A2FF),
                            spreadRadius: 1,
                            colorShadow: Colors.grey.shade400,
                            offset: Offset(1, 4),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(CupertinoIcons.time, color: Colors.white,),
                              SizedBox(height: 15),
                              Text('Completed', style: GoogleFonts.rubik().copyWith(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w600)),
                              SizedBox(height: 10),
                              Text('86 Task', style: GoogleFonts.rubik().copyWith(color: Colors.white,fontSize: 14)),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 170,
                          decoration: BoxStyleConstant.boxShadowButon(
                            radius: 8,
                            blurRadius: 2,
                            color: Color(0xFF8FD14F),
                            spreadRadius: 1,
                            colorShadow: Colors.grey.shade400,
                            offset: Offset(1, 4),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(child: Image.asset(icFolder3d, height: 85, width: 85,)),
                              SizedBox(height: 15),
                              Text('On Going', style: GoogleFonts.rubik().copyWith(color: bluePrimaryColor,fontSize: 15, fontWeight: FontWeight.w600)),
                              SizedBox(height: 10),
                              Text('86 Task', style: GoogleFonts.rubik().copyWith(color: bluePrimaryColor,fontSize: 14)),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }

  oldMenu(){
    return Container(
      margin: EdgeInsets.only(top: 15,left: 20, right: 20),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (BuildContext context, index){
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(data[index]['src'].toString() ?? '' , height: 40, width: 40,
                      errorBuilder: (context, exp, stack){
                        return  Image.asset(icToday, height: 40, width: 40);
                      }),
                  SizedBox(height: 5),
                  Text(data[index]['title'].toString() ?? '', style: TextStyle(fontWeight: FontWeight.w600),)
                ],
              ),
            );
          }
      ),
    );
  }
}
