import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maztafarma/feature/maztafarma/presentation/page/task/status_task_page.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/app_search_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/task/today_task_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/task/weekday_widget.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: AppSearchWidget()
            ),
            WeekdayWidget(onDateClicked: (data)=>Get.to(()=>StatusTaskPage()),),
            SizedBox(height: 15),
            TodayTaskWidget()
          ],
        ),
      ),
    );
  }
}
