import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maztafarma/core/constant/box_style_constant.dart';
import 'package:maztafarma/core/constant/color_constant.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class PriorityChartWidget extends StatelessWidget {
  const PriorityChartWidget({super.key});

  @override
  Widget build(BuildContext context) {


    final List<ChartData> chartData = [
      ChartData('Personal', 35, 0.32, Colors.teal),
      ChartData('Private', 38, 0.21, Colors.orangeAccent),
      ChartData('Secret', 34, 0.38, Colors.deepPurpleAccent),
    ];

    return Container(
      decoration: BoxStyleConstant.boxButton(
          radius: 16, color: purpleTransparent
      ),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Priority', style: GoogleFonts.rubik().copyWith(fontSize: 20, fontWeight: FontWeight.w600, color: bluePrimaryColor)),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 15, width: 15,
                    decoration: BoxStyleConstant.boxCircle(color: Colors.teal),
                  ),
                  SizedBox(width: 3),
                  Text('Personal', style: GoogleFonts.rubik().copyWith(fontSize: 14)),
                  SizedBox(width: 3),
                  Container(
                    height: 15, width: 15,
                    decoration: BoxStyleConstant.boxCircle(color: Colors.orangeAccent),
                  ),
                  SizedBox(width: 3),
                  Text('Private', style: GoogleFonts.rubik().copyWith(fontSize: 14)),
                  SizedBox(width: 3),
                  Container(
                    height: 15, width: 15,
                    decoration: BoxStyleConstant.boxCircle(color: Colors.deepPurpleAccent),
                  ),
                  SizedBox(width: 3),
                  Text('Secret', style: GoogleFonts.rubik().copyWith(fontSize: 14)),
                ],
              ))
            ],
          ),
          SizedBox(height: 10),
          Text('Task per Day', style: GoogleFonts.rubik().copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black26)),
          SizedBox(height: 5),
          Container(
              child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  series: <CartesianSeries>[
                    BubbleSeries<ChartData, String>(
                        dataSource: chartData,
                        sizeValueMapper: (ChartData data, _) => data.size,
                        pointColorMapper:(ChartData data, _) => data.pointColor,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y
                    )
                  ]
              )
          )
        ],
      ),
    );
  }
}



class ChartData {
  ChartData(this.x, this.y, this.size, this.pointColor);
  final String x;
  final double y;
  final double size;
  final Color pointColor;
}
