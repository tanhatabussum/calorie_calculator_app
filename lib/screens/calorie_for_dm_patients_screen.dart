import 'package:flutter/material.dart';

class CalorieForDMPatientsScreen extends StatefulWidget {
  const CalorieForDMPatientsScreen({Key? key}) : super(key: key);

  @override
  _CalorieForDMPatientsScreenState createState() =>
      _CalorieForDMPatientsScreenState();
}

class _CalorieForDMPatientsScreenState
    extends State<CalorieForDMPatientsScreen> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _sugarLevelController = TextEditingController();

  double? _suggestedCalories;
  String? _walkingDuration;

  void _calculateCalorieAndWalking() {
    final double? weight = double.tryParse(_weightController.text);
    final double? age = double.tryParse(_ageController.text);
    final double? sugarLevel = double.tryParse(_sugarLevelController.text);

    if (weight == null ||
        age == null ||
        sugarLevel == null ||
        weight <= 0 ||
        age <= 0 ||
        sugarLevel <= 0) {
      setState(() {
        _suggestedCalories = null;
        _walkingDuration = null;
      });
      return;
    }

    // Calorie suggestion logic (simplified)
    double baseCalories = 2000;
    if (age > 50) {
      baseCalories -= 100; // Older patients need fewer calories
    }
    if (sugarLevel > 180) {
      baseCalories -= 200; // High sugar level leads to fewer calories
    }
    _suggestedCalories = baseCalories;

    // Walking duration (simplified logic)
    int walkingTime = 30; // Default walking time
    if (sugarLevel > 180) {
      walkingTime += 15; // Increase walking time for high sugar level
    }
    _walkingDuration = '$walkingTime minutes of walking per day';

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calorie for DM Patients'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Enter Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Weight Input Field
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (in kg)',
                prefixIcon:
                    const Icon(Icons.monitor_weight, color: Colors.teal),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Age Input Field
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Age (in years)',
                prefixIcon:
                    const Icon(Icons.calendar_today, color: Colors.teal),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Sugar Level Input Field
            TextField(
              controller: _sugarLevelController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Sugar Level (mg/dL)',
                prefixIcon: const Icon(Icons.bloodtype, color: Colors.teal),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Calculate Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 5,
                backgroundColor: Colors.teal,
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onPressed: _calculateCalorieAndWalking,
              icon: const Icon(Icons.calculate, color: Colors.white),
              label: const Text('Calculate'),
            ),

            const SizedBox(height: 30),

            // Displaying the Results
            if (_suggestedCalories != null)
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.restaurant, color: Colors.teal),
                        const SizedBox(width: 10),
                        Text(
                          'Suggested Calorie Intake:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${_suggestedCalories!.toStringAsFixed(0)} kcal/day',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(Icons.directions_walk, color: Colors.teal),
                        const SizedBox(width: 10),
                        Text(
                          'Suggested Walking Duration:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _walkingDuration!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(color: Colors.teal),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.info_outline, color: Colors.orange),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'You should maintain your diet and burn your consumed calorie to remain fit.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange.shade800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
