import 'package:flutter/material.dart';
import 'package:myproject_app/resource/fooderlich_theme.dart';
import 'package:myproject_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: FooderlichTheme.light(),
      home: const Home(),
    );
  }
}
