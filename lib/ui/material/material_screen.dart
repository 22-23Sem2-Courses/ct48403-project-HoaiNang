import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../resource/coffeeTheme.dart';
import './material_manager.dart';
import './edit_material_screen.dart';
import './material_detail.dart';
import './material_item.dart';
import 'package:myproject_app/models/materials.dart';

class MaterialScreen extends StatefulWidget {
  const MaterialScreen({Key? key}) : super(key: key);
  @override
  State<MaterialScreen> createState() => _MaterialScreenState();
}

class _MaterialScreenState extends State<MaterialScreen> {
  @override
  Widget build(BuildContext context) {
    final materials = context.select<MaterialManager, List<Materials>>(
        (MaterialManager) => MaterialManager.items);
    return Consumer<MaterialManager>(
      builder: (ctx, MaterialManager, child) {
        return Scaffold(
          body: ListView.builder(
            itemCount: MaterialManager.itemCount,
            itemBuilder: (cxt, i) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) {
                        return MaterialDetail(
                          materials: materials[i],
                        );
                      },
                    ),
                  );
                },
                child: MaterialItem(materials: materials[i]),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditMaterialScreen(null),
                ),
              );
            },
          ),
        );
      },
    );
  }
  }

 