import 'package:flutter/material.dart';
import 'package:nectar/choose_project_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nectar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF53B175),
      ),
      debugShowCheckedModeBanner: false,
      home: const ChooseProjectScreen(),
    );
  }
}
