import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInputWidget extends StatefulWidget {
  String? title;
  String? hint;
  Function? onChange;
  String? defaultValue;
  AppInputWidget({this.title, this.hint, this.onChange, this.defaultValue});

  @override
  State<AppInputWidget> createState() => _AppInputWidgetState();
}

class _AppInputWidgetState extends State<AppInputWidget> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.defaultValue != null){controller.text = widget.defaultValue!;}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title ?? '',  style: GoogleFonts.rubik().copyWith(color: Colors.black26, fontSize: 16, fontWeight: FontWeight.w600),),
          Container(
            height: 55,
            child: TextField(
              controller: controller,
              style: GoogleFonts.rubik().copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.only(left: 25, top: 12),
                hintStyle:  GoogleFonts.rubik().copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              onChanged: (val)=>widget.onChange!(val),
            ),
          ),
        ],
      ),
    );
  }

  String getValue()=>controller.text;
}
