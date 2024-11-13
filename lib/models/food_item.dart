class FoodItem {
  final String name;
  final int calories;
  final double protein;
  final double fat;
  final double carbohydrates;
  final DateTime date;
  final String imageUrl;

  FoodItem({
    required this.name,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbohydrates,
    required this.date,
    required this.imageUrl, required double carbs,
  });

  get carbs => null;

  // Optional: Add a method to convert FoodItem to a map (useful for persistence)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'calories': calories,
      'protein': protein,
      'fat': fat,
      'carbohydrates': carbohydrates,
      'date': date.toIso8601String(),
      'imageUrl': imageUrl,
    };
  }

  // Optional: Factory constructor to create FoodItem from a map
  factory FoodItem.fromMap(Map<String, dynamic> map) {
    return FoodItem(
      name: map['name'],
      calories: map['calories'],
      protein: map['protein'],
      fat: map['fat'],
      carbohydrates: map['carbohydrates'],
      date: DateTime.parse(map['date']),
      imageUrl: map['imageUrl'], 
      carbs: map['carbs'],
    );
  }
}
