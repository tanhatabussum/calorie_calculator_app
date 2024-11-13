// lib/widgets/food_input_form.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/food_item.dart';
import '../providers/food_provider.dart';

class FoodInputForm extends StatefulWidget {
  const FoodInputForm({Key? key}) : super(key: key);

  @override
  State<FoodInputForm> createState() => _FoodInputFormState();
}

class _FoodInputFormState extends State<FoodInputForm> {
  String? selectedFood;
  final _quantityController = TextEditingController();

  // Predefined food items with nutritional values
  final Map<String, FoodItem> predefinedFoods = {
    'Apple': FoodItem(
      name: 'Apple',
      calories: 52,
      protein: 0.3,
      fat: 0.2,
      carbohydrates: 14,
      date: DateTime.now(),
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/1/15/Red_Apple.jpg',
      carbs: 14,
    ),
    'Banana': FoodItem(
      name: 'Banana',
      calories: 96,
      protein: 1.3,
      fat: 0.3,
      carbohydrates: 27,
      date: DateTime.now(),
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/8/8a/Banana-Single.jpg',
      carbs: 27,
    ),
    'Orange': FoodItem(
      name: 'Orange',
      calories: 43,
      protein: 1,
      fat: 0.1,
      carbohydrates: 9,
      date: DateTime.now(),
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/c/c4/Orange-Fruit-Pieces.jpg',
      carbs: 9,
    ),
  };

  Map<String, double> nutrition = {
    'calories': 0,
    'protein': 0,
    'fat': 0,
    'carbs': 0,
  };

  void _calculateNutrition() {
    if (selectedFood != null && _quantityController.text.isNotEmpty) {
      final foodItem = predefinedFoods[selectedFood]!;
      final quantity = double.tryParse(_quantityController.text) ?? 0;
      setState(() {
        nutrition['calories'] = (foodItem.calories * quantity / 100);
        nutrition['protein'] = (foodItem.protein * quantity / 100);
        nutrition['fat'] = (foodItem.fat * quantity / 100);
        nutrition['carbs'] = (foodItem.carbohydrates * quantity / 100);
      });

      final newFoodItem = FoodItem(
        name: foodItem.name,
        calories: nutrition['calories']!.round(),
        protein: nutrition['protein']!,
        fat: nutrition['fat']!,
        carbohydrates: nutrition['carbs']!,
        date: DateTime.now(),
        imageUrl: foodItem.imageUrl,
        carbs: nutrition['carbs']!,
      );

      Provider.of<FoodProvider>(context, listen: false).addFood(newFoodItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select Food Item',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedFood,
              items: predefinedFoods.keys
                  .map((food) => DropdownMenuItem(
                        value: food,
                        child: Text(food),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedFood = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Food Item',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantity (grams)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateNutrition,
              child: const Text('Calculate & Add'),
            ),
            const SizedBox(height: 20),
            if (selectedFood != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Calories: ${nutrition['calories']!.toStringAsFixed(1)} kcal'),
                  Text(
                      'Protein: ${nutrition['protein']!.toStringAsFixed(1)} g'),
                  Text('Fat: ${nutrition['fat']!.toStringAsFixed(1)} g'),
                  Text('Carbs: ${nutrition['carbs']!.toStringAsFixed(1)} g'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
