import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maztafarma/core/constant/box_style_constant.dart';
import 'package:maztafarma/core/constant/dialog_constant.dart';
import 'package:maztafarma/core/theme/typography.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_doctor.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_product.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_schedule_type.dart';
import 'package:maztafarma/feature/maztafarma/presentation/controller/master/master_controller.dart';
import 'dart:math' as math;

class AppSelectedInputWidget extends StatefulWidget {
  String? title;
  String? hint;
  List? data;
  String? valueDefault;
  TYPE_FIELD? type;
  Function? onSelecteditem;

  AppSelectedInputWidget({this.title, this.hint, this.data, this.valueDefault, this.type, this.onSelecteditem});

  @override
  State<AppSelectedInputWidget> createState() => _AppSelectedInputWidgetState();
}

class _AppSelectedInputWidgetState extends State<AppSelectedInputWidget> {
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
            onTap: ()=>DialogConstant.showBottomSheet(
                context: Get.context,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(widget.title ?? '',  style: mButtonTitle,),
                      ),
                      Divider(),
                      Expanded(child: ListView.builder(
                        itemCount: widget.data!.length,
                        itemBuilder: (context, index){

                          String param = getParamDataList(widget.data![index]);

                          return ListTile(
                            onTap: (){
                              controller.text = param;
                              widget.onSelecteditem!(widget.data![index]);
                              Get.back();
                            },
                            title: Text(param, style: mParagraph.copyWith(fontWeight: FontWeight.w600),),
                          );
                        },
                      ))
                    ],
                  ),
                )
            ),
            child: Container(
              height: 55,
              child: TextField(
                controller: controller,
                style: GoogleFonts.rubik().copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                enabled: false,
                decoration: InputDecoration(
                    hintText: widget.hint ?? '',
                    hintStyle:  GoogleFonts.rubik().copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                    suffixIcon: Icon(CupertinoIcons.chevron_compact_down)
                ),
              ),
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   child: Wrap(
          //     children: [
          //       Directionality(
          //         textDirection: TextDirection.rtl,
          //         child: TextButton.icon(
          //           onPressed: ()=>Get.back(),
          //           label: Text('master dasd',  style: mButtonTitle,),
          //           icon: Icon(CupertinoIcons.xmark_circle),
          //           style: ButtonStyle(
          //               backgroundColor: MaterialStatePropertyAll<Color>(Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
          //               foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
          //               shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
          //                   RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.all(Radius.circular(8))
          //                   )
          //               )
          //
          //           ),
          //         )
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  String getSelectedItem()=>controller.text;

  getParamDataList(Object data){
    var dataModel;

    if(widget.type == null) return data as String;

    if (widget.type == TYPE_FIELD.VISIT_TYPE){
      dataModel = data as EScheduleType;
      return dataModel.name;
    }
    if (widget.type == TYPE_FIELD.DOCTOR){
      dataModel = data as EDoctor;
      return dataModel.nama_dokter;
    }
    if (widget.type == TYPE_FIELD.PRODUCT){
      dataModel = data as EProduct;
      return dataModel.nama_product;
    }
  }

  getModelDataList(Object data){
    var dataModel;

    if(widget.type == null) return data as String;

    if (widget.type == TYPE_FIELD.VISIT_TYPE){
      dataModel = data as EScheduleType;
      return dataModel;
    }
    if (widget.type == TYPE_FIELD.DOCTOR){
      dataModel = data as EDoctor;
      return dataModel;
    }
    if (widget.type == TYPE_FIELD.PRODUCT){
      dataModel = data as EProduct;
      return dataModel;
    }
  }
}
