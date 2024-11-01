import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

enum TYPE { DATE,TIME }

class AppInputDateTimeWidget extends StatefulWidget {
  String? title;
  String? hint;
  Function? onChangeDate;
  TYPE type;
  String? valueDefault;
  AppInputDateTimeWidget({this.title, this.hint, this.type = TYPE.DATE, this.onChangeDate, this.valueDefault});

  @override
  State<AppInputDateTimeWidget> createState() => _AppInputDateTimeWidgetState();
}

class _AppInputDateTimeWidgetState extends State<AppInputDateTimeWidget> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.valueDefault != null) {controller.text = widget.valueDefault!;}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title ?? '',  style: GoogleFonts.rubik().copyWith(color: Colors.black26, fontSize: 16, fontWeight: FontWeight.w600),),
          GestureDetector(
            onTap: ()=> widget.type == TYPE.DATE ? changeDate(context):changeTime(context),
            child: Container(
              height: 55,
              child: TextField(
                controller: controller,
                style: GoogleFonts.rubik().copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.only(left: 25, top: 12),
                  enabled: false,
                  hintStyle:  GoogleFonts.rubik().copyWith(color: Colors.grey.shade400, fontSize: 14),
                  suffixIcon: Icon(widget.type == TYPE.DATE ? CupertinoIcons.calendar_today:CupertinoIcons.time, color: Colors.grey, size: 30,),
                ),
                onChanged: (val)=>widget.onChangeDate!(val),
              ),
            ),
          ),
        ],
      ),
    );
  }

  changeDate(BuildContext context) async {
    var selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(3000));

    if(selectedDate != null)
      // controller.text = DateFormat("dd-MMM-yyy").format(selectedDate);
      controller.text = DateFormat("yyy-MM-dd").format(selectedDate);
      widget.onChangeDate!(controller.text);
  }

  changeTime(BuildContext context) async {
    var time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now());

    if (time != null) {
      controller.text = '${time.hour}:${time.minute}';
    }
  }

  getDateValue()=>controller.text;

  getTimeValue()=>controller.text;
}


