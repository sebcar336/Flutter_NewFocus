import 'package:flutter/material.dart';
import 'package:new_focus_/login_folder/login_screen.dart';
import 'package:new_focus_/styles/palleta.dart';

import 'objectbox/objectbox_interface.dart';

late ObjectBox objectBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Pallete.text),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
