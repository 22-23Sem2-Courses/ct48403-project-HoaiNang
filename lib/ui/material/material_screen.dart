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
        body: Center(
          child: ListView.builder(
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
                child: Row(children: <Widget>[
                  SizedBox(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(MaterialManager().items[index].name),
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
        ));
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
