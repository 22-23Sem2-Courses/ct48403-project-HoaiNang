import 'package:flutter/material.dart';

import '../../resource/coffeeTheme.dart';
import './staff_manager.dart';
import './staff_detail_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: ListView.builder(
              itemCount: StaffManager().itemCount,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return StaffDetailScreen(
                            StaffManager().items[index],
                          );
                        },
                      ),
                    );
                  },
                  child: Row(children: <Widget>[
                    SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(StaffManager().items[index].name),
                            SizedBox(
                                child: Row(children: [
                              buildEditButton(context),
                              buildDeleteButton(context),
                            ]))
                          ],
                        ))
                  ]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDeleteButton(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.delete,
      ),
      onPressed: () {
        print('Delete a product');
      },
      color: Theme.of(context).colorScheme.error,
    );
  }

  Widget buildEditButton(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.edit,
      ),
      onPressed: () {
        print('Go to edit product screen');
      },
      color: Theme.of(context).primaryColor,
    );
  }
}
