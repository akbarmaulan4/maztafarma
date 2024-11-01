import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppChecklistWidget extends StatelessWidget {
  String? title;
  List<String> data;
  String selected;
  Function? onSelect;
  AppChecklistWidget({
    this.title,
    required this.data,
    required this.selected,
    this.onSelect
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title ?? '',  style: GoogleFonts.rubik().copyWith(color: Colors.black26, fontSize: 16, fontWeight: FontWeight.w600),),
          Container(
            child: Wrap(
              children: data.map((e) => Container(
                width: MediaQuery.of(context).size.width*0.4,
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                        value: selected == e ? true : false,
                        onChanged: (val)=>onSelect!(e),
                      ),
                    ),
                    Text(e, style: GoogleFonts.rubik().copyWith(fontSize: 16, fontWeight: FontWeight.w600),),
                  ],
                ),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
