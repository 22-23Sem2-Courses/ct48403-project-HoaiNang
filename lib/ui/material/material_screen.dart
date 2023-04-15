import 'package:flutter/material.dart';

import '../../resource/coffeeTheme.dart';
import './material_manager.dart';
import './material_detail_screen.dart';

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage1> createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: MaterialManager().itemCount,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MaterialDetailScreen(
                       MaterialManager().items[index],
                    );
                  },
                ),
              );
            },
          child: Text(
            
            MaterialManager().items[index].name));
        },
      ),
    );
  }
}