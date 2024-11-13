import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/food_provider.dart';
import '../models/food_item.dart';

class AddFoodScreen extends StatefulWidget {
  const AddFoodScreen({Key? key}) : super(key: key);

  @override
  State<AddFoodScreen> createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _calories = 0;
  double _fat = 0.0;
  double _carbs = 0.0;
  double _protein = 0.0;
  String _imageUrl = '';
  double _carbohydrates = 0.0;

  void _saveFood() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final newFoodItem = FoodItem(
        name: _name,
        calories: _calories,
        fat: _fat,
        carbs: _carbs,
        protein: _protein,
        imageUrl: _imageUrl,
        date: DateTime.now(),
        carbohydrates: _carbohydrates,
      );

      Provider.of<FoodProvider>(context, listen: false).addFood(newFoodItem);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Food'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Food Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a food name' : null,
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Calories (kcal)'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter calories' : null,
                onSaved: (value) => _calories = int.parse(value!),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Fat (g)'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _fat = double.parse(value!),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Carbs (g)'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _carbs = double.parse(value!),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Protein (g)'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _protein = double.parse(value!),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Image URL'),
                onSaved: (value) => _imageUrl = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveFood,
                child: const Text('Add Food'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
