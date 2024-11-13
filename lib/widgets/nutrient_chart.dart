import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class NutrientChart extends StatelessWidget {
  final double carbs;
  final double fat;
  final double protein;

  const NutrientChart(
      {Key? key, required this.carbs, required this.fat, required this.protein})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            value: carbs,
            color: Colors.orange,
            title: 'Carbs',
            radius: 50,
          ),
          PieChartSectionData(
            value: fat,
            color: Colors.red,
            title: 'Fat',
            radius: 50,
          ),
          PieChartSectionData(
            value: protein,
            color: Colors.green,
            title: 'Protein',
            radius: 50,
          ),
        ],
      ),
    );
  }
}
