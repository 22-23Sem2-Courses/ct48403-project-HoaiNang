import 'package:flutter/material.dart';
import 'package:myproject_app/resource/coffeeTheme.dart';
import 'package:myproject_app/home.dart';
import 'package:myproject_app/ui/bill/bill_manager.dart';
import 'package:myproject_app/ui/products/product_manager.dart';
import 'package:provider/provider.dart';

import './ui/staff/staff_manager.dart';
import './ui/material/material_manager.dart';

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
        // ChangeNotifierProvider(
        //   create: (ctx) => StaffManager(),
        // ),
        ChangeNotifierProvider(
          create: (ctx) => MaterialManager(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => BillManager(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: CoffeeTheme.dark(),
        home: const Home(),
      ),
    );
  }
}