import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FlChartScreen extends StatefulWidget {
  const FlChartScreen({super.key});

  @override
  State<FlChartScreen> createState() => _FlChartScreenState();
}

class _FlChartScreenState extends State<FlChartScreen> {
  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildChartBox(
                title: 'Bar Chart',
                widget: BarChart(
                  BarChartData(
                    barGroups: List.generate(3, (index) {
                      final isTouched = index == touchedGroupIndex;
                      final double barHeight = isTouched ? 16 : 12;
                      final gradientColors = isTouched
                          ? [Colors.orange, Colors.red]
                          : [Colors.blue, Colors.lightBlueAccent];
                      return BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: (index + 1) * 4.0,
                            gradient: LinearGradient(
                              colors: gradientColors,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            width: barHeight,
                          ),
                        ],
                      );
                    }),
                    barTouchData: BarTouchData(
                      touchCallback: (event, response) {
                        setState(() {
                          touchedGroupIndex =
                              response?.spot?.touchedBarGroupIndex ?? -1;
                        });
                      },
                      touchTooltipData: BarTouchTooltipData(
                        // tooltipBgColor: Colors.blueGrey,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            "Value: ${(rod.toY).toStringAsFixed(1)}",
                            const TextStyle(color: Colors.white),
                          );
                        },
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    titlesData: const FlTitlesData(show: false),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              buildChartBox(
                title: 'Line Chart',
                widget: LineChart(
                  LineChartData(
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 3),
                          const FlSpot(1, 1),
                          const FlSpot(2, 4),
                          const FlSpot(3, 1.5),
                          const FlSpot(4, 2),
                        ],
                        isCurved: true,
                        color: Colors.blue,
                        gradient: const LinearGradient(
                          colors: [Colors.blue, Colors.purple],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        barWidth: 4,
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: const LinearGradient(
                            colors: [
                              Color(0x662196F3),
                              Color(0x66BBDEFB),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        dotData: const FlDotData(show: true),
                      ),
                    ],
                    borderData: FlBorderData(show: false),
                    titlesData: const FlTitlesData(show: false),
                    lineTouchData: const LineTouchData(
                      touchTooltipData: LineTouchTooltipData(
                          // tooltipBgColor: Colors.blueGrey,
                          ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              buildChartBox(
                title: 'Pie Chart',
                widget: PieChart(
                  PieChartData(
                    sections: List.generate(4, (index) {
                      final colors = [
                        Colors.blue,
                        Colors.red,
                        Colors.green,
                        Colors.orange
                      ];
                      final isTouched = index == touchedGroupIndex;
                      final double radius = isTouched ? 60 : 50;
                      return PieChartSectionData(
                        color: colors[index],
                        value: (index + 1) * 10,
                        title: '${(index + 1) * 10}%',
                        radius: radius,
                        titleStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    }),
                    sectionsSpace: 2,
                    centerSpaceRadius: 40,
                    pieTouchData: PieTouchData(
                      touchCallback: (event, response) {
                        setState(() {
                          touchedGroupIndex =
                              response?.touchedSection?.touchedSectionIndex ??
                                  -1;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChartBox({required String title, required Widget widget}) {
    return Container(
      width: 270,
      height: 240,
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Center(child: widget),
          ),
        ],
      ),
    );
  }
}
