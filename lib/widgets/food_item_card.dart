import 'package:flutter/material.dart';
import '../models/food_item.dart';

class FoodItemCard extends StatelessWidget {
  final FoodItem foodItem;

  const FoodItemCard({Key? key, required this.foodItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(foodItem.imageUrl,
            width: 50, height: 50, fit: BoxFit.cover),
        title: Text(foodItem.name),
        subtitle: Text(
          'Calories: ${foodItem.calories} kcal\n'
          'Carbs: ${foodItem.carbs}g, Fat: ${foodItem.fat}g, Protein: ${foodItem.protein}g',
        ),
        trailing: Text(
          '${foodItem.date.day}/${foodItem.date.month}/${foodItem.date.year}',
        ),
      ),
    );
  }
}
