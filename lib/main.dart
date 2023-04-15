import 'package:flutter/material.dart';
import 'package:myproject_app/resource/coffeeTheme.dart';
import 'package:myproject_app/home.dart';
import './ui/staff/staff_detail_screen.dart';
import './ui/staff/staff_manager.dart';
import './models/staff.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Staff Manager',
      theme: CoffeeTheme.light(),
      home: const Home(),
    );
  }
}


