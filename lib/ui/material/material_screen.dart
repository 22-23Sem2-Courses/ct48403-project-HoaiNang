import 'package:flutter/material.dart';

import '../../resource/coffeeTheme.dart';

class MaterialScreen extends StatelessWidget {
  const MaterialScreen({super.key});

  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Ray Wenderlich';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          color: Colors.amber,
          image: DecorationImage(
            image: AssetImage('assets/mag1.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Stack(
          children: [
            Text(category, style: CoffeeTheme.darkTextTheme.bodyText1),
            Positioned(
              top: 20,
              child: Text(title, style: CoffeeTheme.darkTextTheme.headline2),
            ),
            Positioned(
              bottom: 30,
              right: 0,
              child:
                  Text(description, style: CoffeeTheme.darkTextTheme.bodyText1),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              child: Text(chef, style: CoffeeTheme.darkTextTheme.bodyText1),
            ),
          ],
        ),
      ),
    );
  }
}
