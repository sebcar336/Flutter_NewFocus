import 'package:flutter/material.dart';
import 'package:new_focus_/home_folder/habit_create.dart';
import 'package:new_focus_/widgets/app_bar.dart';

import '../styles/palleta.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(28.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .center, // Centra los elementos horizontalmente
            children: [
              const Text(
                'Mis hábitos',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                ),
              ),
              const SizedBox(width: 50),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Pallete.borderColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const HabitCreate()),
                    );
                  },
                  icon: const Icon(Icons.add),
                  color: Pallete.customColor1,
                  iconSize: 28,
                ),
              ),
              const SizedBox(width: 1),
            ],
          ),
        ),
      ),
    );
  }
}
