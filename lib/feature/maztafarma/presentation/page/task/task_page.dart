import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maztafarma/feature/maztafarma/presentation/controller/task/task_controller.dart';
import 'package:maztafarma/feature/maztafarma/presentation/page/task/status_task_page.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/app_empty_task_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/app_search_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/task/task_list_tile_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/task/today_task_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/task/weekday_widget.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    TaskController taskController = Get.find();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: AppSearchWidget()
                  ),
                  // WeekdayWidget(onDateClicked: (data)=>Get.to(()=>StatusTaskPage()),),
                  WeekdayWidget(onDateClicked: (data)=>taskController.getTaskByDate(data.date)),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Today', style: GoogleFonts.rubik().copyWith(fontSize: 20, fontWeight: FontWeight.w600)),
                      // Text('09 h 45 min', style: GoogleFonts.rubik().copyWith(fontSize: 16)),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Obx(() => Expanded(
                child: taskController.dataTask.value!.length > 0 ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: ListView.builder(
                    itemCount: taskController.dataTask.value!.length,
                    itemBuilder: (context, index){
                      return TaskListTileWidget(
                        data: taskController.dataTask.value![index],
                      );
                    },
                  ),
                ):AppEmptyTaskWidget()))
            // Obx(() => TodayTaskWidget(data: taskController.dataTask.value,))
          ],
        ),
      ),
    );
  }
}
