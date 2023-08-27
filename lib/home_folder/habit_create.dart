import 'package:flutter/material.dart';
import 'package:new_focus_/widgets/app_bar.dart';

import '../styles/palleta.dart';

class HabitCreate extends StatefulWidget {
  const HabitCreate({super.key});

  @override
  State<HabitCreate> createState() => _HabitCreateState();
}

class _HabitCreateState extends State<HabitCreate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 18),
            children: [
              StylizedText(
                firstPart: '  New ',
                secondPart: 'Focus',
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 25),
          ),
        ],
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'Crear hábitos',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
