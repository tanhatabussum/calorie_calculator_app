import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/food_item.dart';

class CalorieCalculatorScreen extends StatefulWidget {
  const CalorieCalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalorieCalculatorScreenState createState() =>
      _CalorieCalculatorScreenState();
}

class _CalorieCalculatorScreenState extends State<CalorieCalculatorScreen> {
  List<String> selectedFoods = [];
  Map<String, double> foodQuantities = {};

  // Predefined food items
  final Map<String, FoodItem> predefinedFoods = {
    'Apple': FoodItem(
      name: 'Apple',
      calories: 52,
      protein: 0.3,
      fat: 0.2,
      carbohydrates: 14,
      carbs: 14,
      date: DateTime.now(),
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/1/15/Red_Apple.jpg',
    ),
    'Banana': FoodItem(
      name: 'Banana',
      calories: 96,
      protein: 1.3,
      fat: 0.3,
      carbohydrates: 27,
      carbs: 27,
      date: DateTime.now(),
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/8/8a/Banana-Single.jpg',
    ),
    'Orange': FoodItem(
      name: 'Orange',
      calories: 43,
      protein: 1,
      fat: 0.1,
      carbohydrates: 9,
      carbs: 9,
      date: DateTime.now(),
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/c/c4/Orange-Fruit-Pieces.jpg',
    ),
    'Rice': FoodItem(
      name: 'Rice',
      calories: 130,
      protein: 2.7,
      fat: 0.3,
      carbohydrates: 28,
      carbs: 28,
      date: DateTime.now(),
      imageUrl: '',
    ),
    'Roti': FoodItem(
      name: 'Roti',
      calories: 297,
      protein: 9.8,
      fat: 3.7,
      carbohydrates: 56,
      carbs: 56,
      date: DateTime.now(),
      imageUrl: '',
    ),
    'Egg': FoodItem(
      name: 'Egg',
      calories: 155,
      protein: 13,
      fat: 11,
      carbohydrates: 1.1,
      carbs: 1.1,
      date: DateTime.now(),
      imageUrl: '',
    ),
    'Chicken': FoodItem(
      name: 'Chicken',
      calories: 239,
      protein: 27,
      fat: 14,
      carbohydrates: 0,
      carbs: 0,
      date: DateTime.now(),
      imageUrl: '',
    ),
    'Beef': FoodItem(
      name: 'Beef',
      calories: 250,
      protein: 26,
      fat: 15,
      carbohydrates: 0,
      carbs: 0,
      date: DateTime.now(),
      imageUrl: '',
    ),
    'Mutton': FoodItem(
      name: 'Mutton',
      calories: 294,
      protein: 25,
      fat: 21,
      carbohydrates: 0,
      carbs: 0,
      date: DateTime.now(),
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/9/98/Mutton_Curry.jpg',
    ),
    'Dal': FoodItem(
      name: 'Dal',
      calories: 116,
      protein: 9,
      fat: 0.6,
      carbohydrates: 20,
      carbs: 20,
      date: DateTime.now(),
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/f/f7/Dal_Tadka.jpg',
    ),
    'Fish': FoodItem(
      name: 'Fish',
      calories: 206,
      protein: 22,
      fat: 12,
      carbohydrates: 0,
      carbs: 0,
      date: DateTime.now(),
      imageUrl: '',
    ),
    'Milk': FoodItem(
      name: 'Milk',
      calories: 42,
      protein: 3.4,
      fat: 1,
      carbohydrates: 5,
      carbs: 5,
      date: DateTime.now(),
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/a/a3/Glass_of_milk.jpg',
    ),
    'Butter': FoodItem(
      name: 'Butter',
      calories: 717,
      protein: 0.9,
      fat: 81,
      carbohydrates: 0.1,
      carbs: 0.1,
      date: DateTime.now(),
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/4/44/Butter.jpg',
    ),
    'Guava': FoodItem(
      name: 'Guava',
      calories: 68,
      protein: 2.6,
      fat: 1,
      carbohydrates: 14,
      carbs: 14,
      date: DateTime.now(),
      imageUrl: '',
    ),
    'Papaya': FoodItem(
      name: 'Papaya',
      calories: 43,
      protein: 0.5,
      fat: 0.1,
      carbohydrates: 11,
      carbs: 11,
      date: DateTime.now(),
      imageUrl: '',
    ),
    'Date': FoodItem(
      name: 'Date',
      calories: 277,
      protein: 1.8,
      fat: 0.2,
      carbohydrates: 75,
      carbs: 75,
      date: DateTime.now(),
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/3/36/Khajur.JPG',
    ),
  };

  Map<String, double> calculatedNutrition = {
    'calories': 0.0,
    'protein': 0.0,
    'fat': 0.0,
    'carbs': 0.0,
  };

  // Function to calculate nutrition for all selected foods
  void _calculateTotalNutrition() {
    // Reset the calculated nutrition totals before accumulating new values
    calculatedNutrition = {
      'calories': 0.0,
      'protein': 0.0,
      'fat': 0.0,
      'carbs': 0.0,
    };

    // Iterate over each selected food item
    for (var foodName in selectedFoods) {
      final quantity = foodQuantities[foodName] ?? 0;
      final foodItem = predefinedFoods[foodName];

      if (foodItem != null && quantity > 0) {
        // Add the nutrition values of the current food item to the total
        calculatedNutrition['calories'] = calculatedNutrition['calories']! +
            (foodItem.calories * quantity / 100);
        calculatedNutrition['protein'] = calculatedNutrition['protein']! +
            (foodItem.protein * quantity / 100);
        calculatedNutrition['fat'] =
            calculatedNutrition['fat']! + (foodItem.fat * quantity / 100);
        calculatedNutrition['carbs'] =
            calculatedNutrition['carbs']! + (foodItem.carbs * quantity / 100);
      }
    }

    // Trigger a state update to reflect the recalculated values
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calorie Calculator'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            const Text(
              'Select Food Items',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: null,
              hint: const Text('Select a food item'),
              items: predefinedFoods.keys
                  .map((food) => DropdownMenuItem(
                        value: food,
                        child: Text(food),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null && !selectedFoods.contains(value)) {
                  setState(() {
                    selectedFoods.add(value);
                    foodQuantities[value] = 0;
                  });
                }
              },
              decoration: const InputDecoration(
                labelText: 'Food Item',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: selectedFoods.length,
                itemBuilder: (context, index) {
                  String foodName = selectedFoods[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(foodName),
                      trailing: SizedBox(
                        width: 100,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'grams',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              foodQuantities[foodName] =
                                  double.tryParse(value) ?? 0;
                            });
                            _calculateTotalNutrition();
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            if (selectedFoods.isNotEmpty)
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Nutrition Summary:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                          'Total Calories: ${calculatedNutrition['calories']!.toStringAsFixed(1)} kcal'),
                      Text(
                          'Total Protein: ${calculatedNutrition['protein']!.toStringAsFixed(1)} g'),
                      Text(
                          'Total Fat: ${calculatedNutrition['fat']!.toStringAsFixed(1)} g'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
