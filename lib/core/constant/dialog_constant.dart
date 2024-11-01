
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:maztafarma/core/theme/typography.dart';

import 'color_constant.dart';

class DialogConstant {

  // static showToast(String message){
  //   return Fluttertoast.showToast(
  //     msg: message,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.CENTER,
  //   );
  // }
  static alertMessage(String title, String message, void callback()) {
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(title, style: mDialogTitle,),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(message, style: mParagraph,),
                ),
                SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: redPrimaryColor,
                ),
                GestureDetector(
                  onTap: (){
                    Get.back();
                    callback();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "OKE",
                      textAlign: TextAlign.center,
                      style: mDialogTitle,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
  static loading() {
    return showDialog<void>(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Container(
            height: MediaQuery.of(context).size.height*0.15,
            child: SpinKitWave(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.white : Colors.white24,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
  //
  // static void progressDialog() {
  //   showDialog(
  //     context: Get.context!,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return WillPopScope(
  //         onWillPop: () async => false,
  //         child: Dialog(
  //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  //           child: Container(
  //             padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
  //             child: Row(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: <Widget>[
  //                 SizedBox(width: 40, height: 40, child: CircularProgressIndicator()),
  //                 Container(
  //                   margin: EdgeInsets.only(left: 15),
  //                   child: Text(
  //                     'Memproses ...',
  //                     // style: TStyleConstant.semiBold.copyWith(
  //                     //     fontWeight: FontWeight.w600,
  //                     //     fontSize: 18,
  //                     //     color: ColorConstant.primary1),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     }
  //   );
  // }
  //
  //
  //
  static showBottomSheet({BuildContext? context, Widget? child}){

    // final RenderBox renderBox = key.currentContext.findRenderObject();
    // final componentPosition = renderBox.localToGlobal(Offset.zero);
    // double sheetHeight = MediaQuery.of(context).size.height - componentPosition.dy;

    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context!,
        builder: (BuildContext bc) {
          return child!;
        }
    );
  }
  //
  static bottomSheetScrolled({BuildContext? context, Widget? child}){
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        context: context!,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.2,
            maxChildSize: 0.75,
            expand: false,
            builder: (context, scroll){
              return child!;
            },
          );
        }
    );
  }
  //
  // static showSnackBar(messages) {
  //   Get.snackbar(
  //       '', messages,
  //       snackPosition: SnackPosition.BOTTOM,
  //       // backgroundColor: ColorConstant.white,
  //       snackStyle: SnackStyle.FLOATING,
  //       // borderColor: ColorConstant.primary2,
  //       borderWidth: 1,
  //       titleText: Container(),
  //       borderRadius: 1,
  //       messageText: Center(
  //         child: Text(messages, style: TStyleRevamp.regular.copyWith(
  //             color: redPrimaryColor, fontSize: 12),
  //         ),
  //       ),
  //       margin: EdgeInsets.only(bottom: 70, left: 10, right: 10)
  //   );
  // }

}
