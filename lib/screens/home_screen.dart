import 'package:calorie_calculator/screens/calorie_for_dm_patients_screen.dart';
import 'package:flutter/material.dart';
import 'food_details_screen.dart';
import 'user_progress_screen.dart';
import 'profile_screen.dart';
import 'bmi_calculator_screen.dart';
import 'calorie_calculator_screen.dart';
import '../widgets/home_button_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Calorie Calculator',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Center(
                  child: Image.asset(
                    'assets/logo.png',
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: ListView(
                    children: [
                      HomeButtonCard(
                        title: 'Calculate Calorie',
                        icon: Icons.food_bank,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CalorieCalculatorScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      HomeButtonCard(
                        title: 'View Food Items',
                        icon: Icons.fastfood,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FoodDetailsScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      HomeButtonCard(
                        title: 'Calorie for DM Patients',
                        icon: Icons.health_and_safety,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CalorieForDMPatientsScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      HomeButtonCard(
                        title: 'Calculate BMI',
                        icon: Icons.calculate,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BMICalculatorScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
