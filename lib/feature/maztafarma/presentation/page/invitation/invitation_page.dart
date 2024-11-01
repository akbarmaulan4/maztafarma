import 'package:flutter/material.dart';
import 'package:maztafarma/core/constant/box_style_constant.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/app_search_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/home/schedule_section_home_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/invitation/invitation_info_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../widget/header_user_widget.dart';

class InvitationPage extends StatefulWidget {
  const InvitationPage({super.key});

  @override
  State<InvitationPage> createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {

  final List<ChartData> chartData = [
    ChartData('Total Kunjungan', 140),
    ChartData('Kunjungan', 40),
    ChartData('Belum Dikunjungi', 100),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          HeaderUserWidget(),
          // InvitationInfoWidget(),
          // Container(
          //   padding: EdgeInsets.all(20),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text('Kunjungan kamu', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),)
          //     ],
          //   ),
          // ),
          Container(
              child: SfCircularChart(
                  legend: Legend(isVisible: true, position: LegendPosition.bottom),
                  series: <CircularSeries>[
                    // Renders radial bar chart
                    RadialBarSeries<ChartData, String>(
                        maximumValue: 140,
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        cornerStyle: CornerStyle.bothCurve
                    )
                  ]
              )
          ),
          ScheduleSectionHomeWidget(data:[], title: 'Jadwal Bulan Depan',)
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
