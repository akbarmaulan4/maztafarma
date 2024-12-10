import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maztafarma/feature/maztafarma/presentation/controller/task/task_controller.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/header_user_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/home/main_menu_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/home/schedule_section_home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TaskController taskController = Get.find();

  var menu = [
    {'title': 'Today', 'src': 'assets/icon/ic_today.png'},
    {'title': 'Jadwal', 'src': 'assets/icon/ic_schedule.png'},
    {'title': 'Bulan Ini', 'src': 'assets/icon/ic_month.png'},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskController.getViewTotalTask();
    taskController.getTodayTask();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(()=>ListView(
        children: [
          HeaderUserWidget(),
          SizedBox(height: 15),
          // Container(
          //   padding: EdgeInsets.all(20),
          //   child: Text('Ayo kita semangat untuk lebih productif', style: GoogleFonts.rubik().copyWith(fontSize: 25, fontWeight: FontWeight.w600))
          // ),
          // Container(
          //     padding: EdgeInsets.symmetric(horizontal: 10),
          //     child: SearchWidget()
          // ),
          // SizedBox(height: 25),
          // SlideshowWidget(),
          MainMenuWidget(data: menu, taskView: taskController.menuDashboard.value,),
          ScheduleSectionHomeWidget(data: taskController.dataTask.value, title: 'Today Task',),
          // AnnounceSectionHomeWidget()
        ],
      )),
    );
  }
}
