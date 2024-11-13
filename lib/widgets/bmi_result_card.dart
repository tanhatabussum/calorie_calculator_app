import 'package:flutter/material.dart';

class BMIResultCard extends StatelessWidget {
  final double bmi;
  final String status;
  final String calorieSuggestion;
  final Color statusColor;

  const BMIResultCard({
    Key? key,
    required this.bmi,
    required this.status,
    required this.calorieSuggestion,
    required this.statusColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Your BMI: ${bmi.toStringAsFixed(1)}',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: statusColor),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                status,
                style: TextStyle(fontSize: 20, color: statusColor),
              ),
            ),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              'Suggested Calorie Intake:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              calorieSuggestion,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
