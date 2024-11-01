import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maztafarma/core/constant/color_constant.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/statistic/activity_chart_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/statistic/priority_chart_widget.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Statistic', style: GoogleFonts.rubik().copyWith(fontSize: 25, fontWeight: FontWeight.w600, color: bluePrimaryColor)),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            PriorityChartWidget(),
            ActivityChartWidget()
          ],
        ),
      ),
    );
  }
}
