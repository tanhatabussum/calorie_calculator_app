import 'package:calorie_calculator/models/food_item.dart';
import 'package:flutter/material.dart';
import 'models/food_item.dart';

class FoodProvider with ChangeNotifier {
  // Private list of food items
  List<FoodItem> _foodItems = [];

  // Public getter to access the list
  List<FoodItem> get foodItems => _foodItems;

  // Method to initialize with sample data (Optional)
  void initializeSampleData() {
    _foodItems = [
      FoodItem(
        name: 'Apple',
        calories: 95,
        protein: 0.5,
        fat: 0.3,
        carbohydrates: 25,
        carbs: 25,
        date: DateTime.now(),
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/1/15/Red_Apple.jpg',
      ),
      FoodItem(
        name: 'Banana',
        calories: 105,
        protein: 1.3,
        fat: 0.4,
        carbs: 27,
        carbohydrates: 27,
        date: DateTime.now().subtract(const Duration(days: 1)),
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/8/8a/Banana-Single.jpg',
      ),
    ];
    notifyListeners();
  }

  // Method to add a new food item
  void addFood(FoodItem foodItem) {
    _foodItems.add(foodItem);
    notifyListeners();
  }

  // Method to remove a food item by index
  void removeFood(int index) {
    if (index >= 0 && index < _foodItems.length) {
      _foodItems.removeAt(index);
      notifyListeners();
    }
  }

  // Method to update an existing food item
  void updateFood(int index, FoodItem updatedFood) {
    if (index >= 0 && index < _foodItems.length) {
      _foodItems[index] = updatedFood;
      notifyListeners();
    }
  }

  // Method to get food items by a specific date
  List<FoodItem> getFoodByDate(DateTime date) {
    return _foodItems
        .where((item) =>
            item.date.year == date.year &&
            item.date.month == date.month &&
            item.date.day == date.day)
        .toList();
  }

  // Method to clear all food items (Optional)
  void clearAllFoods() {
    _foodItems.clear();
    notifyListeners();
  }
}
