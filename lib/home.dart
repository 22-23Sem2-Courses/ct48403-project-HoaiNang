import 'package:flutter/material.dart';

import './ui/screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = [
    const MaterialScreen(),
    const ProductScreen(),
    const StaffScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Coffee Manager',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.adb_outlined),
            label: 'Staff',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop_rounded),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets_sharp),
            label: 'Material',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
