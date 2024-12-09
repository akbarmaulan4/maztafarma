import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maztafarma/core/constant/image_constant.dart';

class AppEmptyTaskWidget extends StatelessWidget {
  const AppEmptyTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Text('Task kamu kosong, Ayo buat task!', style: GoogleFonts.rubik().copyWith(fontSize: 16, fontWeight: FontWeight.w600),),
        Center(
          child: Image.asset(
            noData,
            height: MediaQuery.of(context).size.width*0.7,
            width: MediaQuery.of(context).size.width*0.7,
          ),
        ),
      ],
    );
  }
}
