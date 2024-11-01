import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maztafarma/core/constant/box_style_constant.dart';
import 'package:maztafarma/core/constant/color_constant.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ActivityChartWidget extends StatelessWidget {
  const ActivityChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('01', 12, 10, 14, 20),
      ChartData('02', 14, 11, 18, 23),
      ChartData('03', 16, 10, 15, 20),
      ChartData('04', 18, 16, 18, 24)
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your Activity', style: GoogleFonts.rubik().copyWith(fontSize: 20, fontWeight: FontWeight.w600)),
          SizedBox(height: 15),
          Container(
              decoration: BoxStyleConstant.boxButton(
                  radius: 16, color: purpleTransparent
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(CupertinoIcons.chevron_left, size: 35, color: bluePrimaryColor,),
                      Text('${DateTime.now().year}', style: GoogleFonts.rubik().copyWith(fontSize: 25, fontWeight: FontWeight.w600, color: bluePrimaryColor)),
                      Icon(CupertinoIcons.chevron_right, size: 35, color: bluePrimaryColor),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        series: <CartesianSeries>[
                          StackedColumnSeries<ChartData, String>(
                              dataSource: chartData,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1
                          ),
                          StackedColumnSeries<ChartData, String>(
                              dataSource: chartData,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y2
                          ),
                          StackedColumnSeries<ChartData,String>(
                              dataSource: chartData,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y3
                          ),
                          StackedColumnSeries<ChartData, String>(
                              dataSource: chartData,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y4
                          )
                        ]
                    ),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}

class ChartData{
  ChartData(this.x, this.y1, this.y2, this.y3, this.y4);
  final String x;
  final double y1;
  final double y2;
  final double y3;
  final double y4;
}

