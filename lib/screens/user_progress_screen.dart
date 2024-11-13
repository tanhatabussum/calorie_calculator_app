import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/food_provider.dart';
import '../widgets/circular_chart.dart';

class UserProgressScreen extends StatelessWidget {
  const UserProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foodItems = Provider.of<FoodProvider>(context).foodItems;

    double totalCarbs = 0;
    double totalProtein = 0;
    double totalFat = 0;

    for (var item in foodItems) {
      totalCarbs += item.carbohydrates;
      totalProtein += item.protein;
      totalFat += item.fat;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Chart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CircularChart(
          carbs: totalCarbs,
          protein: totalProtein,
          fat: totalFat,
        ),
      ),
    );
  }
}
