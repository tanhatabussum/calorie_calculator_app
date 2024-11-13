import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/food_provider.dart';
import '../models/food_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foodProvider = Provider.of<FoodProvider>(context);
    final List<FoodItem> foodHistory = foodProvider.foodItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile & History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Food Intake History:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: foodHistory.length,
                itemBuilder: (context, index) {
                  final foodItem = foodHistory[index];
                  return ListTile(
                    leading: Image.network(foodItem.imageUrl,
                        width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(foodItem.name),
                    subtitle: Text(
                      'Calories: ${foodItem.calories} kcal, '
                      'Carbs: ${foodItem.carbs}g, '
                      'Fat: ${foodItem.fat}g, '
                      'Protein: ${foodItem.protein}g',
                    ),
                    trailing: Text(
                      '${foodItem.date.day}/${foodItem.date.month}/${foodItem.date.year}',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
