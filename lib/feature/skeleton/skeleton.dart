import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:maztafarma/core/constant/color_constant.dart';
import 'package:maztafarma/feature/maztafarma/presentation/page/task/preview_add_task_page.dart';
import 'package:maztafarma/feature/skeleton/controller/skeleton_controller.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({super.key});

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {

  DateTime? currentBackPressTime;
  SkeletonController controller = SkeletonController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>WillPopScope(
        onWillPop: onWillPop,
        child: Container(
          color: Colors.grey.shade100,
          child: controller.changePage(),
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: greenPrimaryColor,
        shape: const CircleBorder(),
        // onPressed: ()=>Get.to(()=>AddTaskPage()),
        onPressed: ()=>Get.to(()=>PreviewAddTaskPage()),
        child: Icon(CupertinoIcons.add_circled, size: 32, color: Colors.white,),
      ),
      bottomNavigationBar: Obx(()=>BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        color: Colors.white24,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        elevation: 2,
        // surfaceTintColor: Colors.white24,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(CupertinoIcons.house_fill, color: controller.currentMenu.value == 0 ? greenPrimaryColor:Colors.black26),
              onPressed: ()=>controller.changeMenu(0),
            ),
            IconButton(
              icon: Icon(CupertinoIcons.doc_append, color: controller.currentMenu.value == 1 ? greenPrimaryColor:Colors.black26),
              onPressed: ()=>controller.changeMenu(1),
            ),
            IconButton(
              icon: Icon(CupertinoIcons.chart_pie_fill, color: controller.currentMenu.value == 2 ? greenPrimaryColor:Colors.black26),
              onPressed: ()=>controller.changeMenu(2),
            ),
            IconButton(
              icon: Icon(CupertinoIcons.folder_solid, color: controller.currentMenu.value == 3 ? greenPrimaryColor:Colors.black26),
              onPressed: ()=>controller.changeMenu(3),
            ),
          ],
        ),
      )),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Tekan sekali lagi untuk keluar aplikasi');
      return Future.value(false);
    }
    return Future.value(true);
  }
}
