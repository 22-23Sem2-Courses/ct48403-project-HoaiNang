import 'package:flutter/material.dart';
import 'package:myproject_app/resource/coffeeTheme.dart';
import 'package:myproject_app/home.dart';
import 'package:myproject_app/ui/products/product_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductManager(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: CoffeeTheme.light(),
        home: const Home(),
      ),
    );
  }
}
