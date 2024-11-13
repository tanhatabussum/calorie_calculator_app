import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/bmi_result_card.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({Key? key}) : super(key: key);

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  final TextEditingController _feetController = TextEditingController();
  final TextEditingController _inchesController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double? _bmi;
  String _status = '';
  String _calorieSuggestion = '';
  Color _statusColor = Colors.teal;

  void _calculateBMI() {
    final double? feet = double.tryParse(_feetController.text);
    final double? inches = double.tryParse(_inchesController.text);
    final double? weight = double.tryParse(_weightController.text);

    if (feet == null ||
        inches == null ||
        weight == null ||
        feet <= 0 ||
        weight <= 0) {
      setState(() {
        _status = 'Please enter valid values';
        _bmi = null;
      });
      return;
    }

    // Convert height in feet and inches to centimeters
    double heightInCm = (feet * 30.48) + (inches * 2.54);

    double bmi = weight / ((heightInCm / 100) * (heightInCm / 100));
    setState(() {
      _bmi = bmi;
      _updateBMIStatus(bmi);
    });
  }

  void _updateBMIStatus(double bmi) {
    if (bmi < 18.5) {
      _status = 'Underweight';
      _statusColor = Colors.blueAccent;
      _calorieSuggestion = '2500-2800 kcal/day';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      _status = 'Normal Weight';
      _statusColor = Colors.green;
      _calorieSuggestion = '2000-2500 kcal/day';
    } else if (bmi >= 25 && bmi < 29.9) {
      _status = 'Overweight';
      _statusColor = Colors.orange;
      _calorieSuggestion = '1800-2200 kcal/day';
    } else {
      _status = 'Obese';
      _statusColor = Colors.redAccent;
      _calorieSuggestion = '1500-1800 kcal/day. Consult a doctor';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Enter Your Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            // Height Input in Feet
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _feetController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Height (feet)',
                      prefixIcon: const Icon(Icons.height, color: Colors.teal),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                // Height Input in Inches
                Expanded(
                  child: TextField(
                    controller: _inchesController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Height (inches)',
                      prefixIcon: const Icon(Icons.height, color: Colors.teal),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Weight Input
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (in kg)',
                prefixIcon:
                    const Icon(FontAwesomeIcons.weight, color: Colors.teal),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: _calculateBMI,
              child: const Text(
                'Calculate BMI',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 40),
            if (_bmi != null)
              Column(
                children: [
                  BMIResultCard(
                    bmi: _bmi!,
                    status: _status,
                    statusColor: _statusColor,
                    calorieSuggestion: _calorieSuggestion,
                  ),
                  const SizedBox(height: 20),

                  // Beautified Message Bar
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.teal, Colors.teal],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.local_fire_department,
                            color: Colors.white, size: 28),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'You should burn the calories you have taken to remain fit.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
