import 'package:flutter/material.dart';
import '../models/food_item.dart';

class FoodDetailsScreen extends StatefulWidget {
  const FoodDetailsScreen({Key? key}) : super(key: key);

  @override
  _FoodDetailsScreenState createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  final _quantityController = TextEditingController();

  String? _selectedFood;
  List<Map<String, dynamic>> _foodEntries = [];

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

  void _addFoodEntry() {
    if (_selectedFood != null && _quantityController.text.isNotEmpty) {
      final quantity = double.tryParse(_quantityController.text) ?? 0;
      final foodItem = predefinedFoods[_selectedFood!];

      if (foodItem != null && quantity > 0) {
        final calories = (foodItem.calories * quantity) / 100;

        setState(() {
          _foodEntries.add({
            'date': DateTime.now().toString().split(' ')[0],
            'foodName': foodItem.name,
            'quantity': quantity,
            'calories': calories,
          });
        });

        _quantityController.clear();
      }
    }
  }

  double getTotalCalories() {
    return _foodEntries.fold(
        0, (total, entry) => total + (entry['calories'] ?? 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Items Tracker'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date: ${DateTime.now().toLocal().toString().split(' ')[0]}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.teal.shade50,
              ),
              child: DropdownButtonFormField<String>(
                value: _selectedFood,
                hint: const Text('Select Food Item'),
                items: predefinedFoods.keys.map((foodName) {
                  return DropdownMenuItem(
                    value: foodName,
                    child: Text(foodName),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedFood = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Food Item',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Quantity input field
            TextFormField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantity (grams)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Add Food Entry Button
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade700,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: _addFoodEntry,
                icon: const Icon(Icons.add, color: Colors.white, size: 24),
                label: const Text(
                  'Add Food Entry',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Total Calories Bar
            Card(
              color: Colors.teal.shade50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Calories:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${getTotalCalories().toStringAsFixed(2)} kcal',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Data Table for Food Entries
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor:
                        MaterialStateColor.resolveWith((states) => Colors.teal),
                    columns: const [
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Food')),
                      DataColumn(label: Text('Quantity (g)')),
                      DataColumn(label: Text('Calories (kcal)')),
                    ],
                    rows: _foodEntries.map((entry) {
                      return DataRow(cells: [
                        DataCell(Text(entry['date'])),
                        DataCell(Text(entry['foodName'])),
                        DataCell(Text('${entry['quantity']}g')),
                        DataCell(Text('${entry['calories']} kcal')),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
