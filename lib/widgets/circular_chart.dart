// lib/widgets/circular_chart.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CircularChart extends StatelessWidget {
  final double carbs;
  final double protein;
  final double fat;

  const CircularChart({
    Key? key,
    required this.carbs,
    required this.protein,
    required this.fat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        height: 250,
        child: PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(
                value: carbs,
                color: Colors.blue,
                title: 'Carbs',
                radius: 50,
                titleStyle: const TextStyle(color: Colors.white, fontSize: 14),
              ),
              PieChartSectionData(
                value: protein,
                color: Colors.green,
                title: 'Protein',
                radius: 50,
                titleStyle: const TextStyle(color: Colors.white, fontSize: 14),
              ),
              PieChartSectionData(
                value: fat,
                color: Colors.red,
                title: 'Fat',
                radius: 50,
                titleStyle: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
            sectionsSpace: 3,
            centerSpaceRadius: 30,
          ),
        ),
      ),
    );
  }
}
