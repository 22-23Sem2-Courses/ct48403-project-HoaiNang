import 'package:flutter/material.dart';
import 'package:myproject_app/ui/material/material_manager.dart';
import 'package:myproject_app/ui/material/material_screen.dart';
import 'package:provider/provider.dart';

import '../../models/materials.dart';
import '../../resource/dialog.dart';

class EditMaterialScreen extends StatefulWidget {
  EditMaterialScreen(
    Materials? materials, {
    super.key,
  }) {
    if (materials == null) {
      this.materials = Materials(
        id: null,
        name: '',
        SoLuongNhap: 0,
        SoLuongConLai: 0,
        DonViTinh: '',
        image: ''
      );
    } else {
      this.materials = materials;
    }
  }
  late final Materials materials;
  @override
  State<EditMaterialScreen> createState() => _EditMaterialScreenState();
}

class _EditMaterialScreenState extends State<EditMaterialScreen> {
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _editForm = GlobalKey<FormState>();
  late Materials _editedMaterial;
  var _isLoading = false;
  bool _isValidImageUrl(String value) {
    return (value.startsWith('http') ||
        value.startsWith('https') ||
        value.startsWith('assets') && value.endsWith('.png') ||
        value.endsWith('.jpg') ||
        value.endsWith('.jpeg'));
  }

  @override
  void initState() {
    _imageUrlFocusNode.addListener(() {
      if (!_imageUrlFocusNode.hasFocus) {
        if (!_isValidImageUrl(_imageUrlController.text)) {
          return;
        }
        setState(() {});
      }
    });
    _editedMaterial = widget.materials;
    _imageUrlController.text = _editedMaterial.image;
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Materials'),
        actions: <Widget>[
          IconButton(
            onPressed: _saveForm,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _editForm,
                child: ListView(
                  children: <Widget>[
                    buildNameField(),
                    buildSoLgNhapField(),
                    buildSoLgConLaiField(),
                    buildDonViTinhField(),
                    buildMaterialPreview(),
                  ],
                ),
              ),
            ),
    );
  }

  TextFormField buildNameField() {
    return TextFormField(
      initialValue: _editedMaterial.name,
      decoration: const InputDecoration(labelText: 'Name'),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide a value';
        }
        return null;
      },
      onSaved: (value) {
        _editedMaterial = _editedMaterial.copyWith(name: value);
      },
    );
  }

  TextFormField buildDonViTinhField() {
    return TextFormField(
      initialValue: _editedMaterial.DonViTinh,
      decoration: const InputDecoration(labelText: 'Don vi tinh'),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide a value';
        }
        return null;
      },
      onSaved: (value) {
        _editedMaterial = _editedMaterial.copyWith(DonViTinh: value);
      },
    );
  }

  TextFormField buildSoLgNhapField() {
    return TextFormField(
      initialValue: _editedMaterial.SoLuongNhap.toString(),
      decoration: const InputDecoration(labelText: 'So Luong Nhap'),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide a value';
        }
        return null;
      },
      onSaved: (value) {
        _editedMaterial = _editedMaterial.copyWith(SoLuongNhap: int.parse(value!));
      },
    );
  }
TextFormField buildSoLgConLaiField() {
    return TextFormField(
      initialValue: _editedMaterial.SoLuongConLai.toString(),
      decoration: const InputDecoration(labelText: 'So Luong Con Lai'),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide a value';
        }
        return null;
      },
      onSaved: (value) {
        _editedMaterial = _editedMaterial.copyWith(SoLuongConLai: int.parse(value!));
      },
    );
  }
  Widget buildMaterialPreview() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.only(
            top: 8,
            right: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _imageUrlController.text.isEmpty
              ? const Text('Enter a URL')
              : FittedBox(
                  child: Image.network(
                    _imageUrlController.text,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        Expanded(
          child: buildImageURLField(),
        ),
      ],
    );
  }

  TextFormField buildImageURLField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Image URL"),
      keyboardType: TextInputType.url,
      textInputAction: TextInputAction.done,
      controller: _imageUrlController,
      focusNode: _imageUrlFocusNode,
      onFieldSubmitted: (value) => _saveForm(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a valid image URL';
        }
        if (!_isValidImageUrl(value)) {
          return 'Please enter a valid image URL';
        }
        return null;
      },
      onSaved: (value) {
        _editedMaterial = _editedMaterial.copyWith(image: value);
      },
    );
  }

  Future<void> _saveForm() async {
    final isValid = _editForm.currentState!.validate();
    if (!isValid) {
      return;
    }
    _editForm.currentState!.save();
    setState(() {
      _isLoading = true;
    });

    try {
      final materialManager = context.read<MaterialManager>();
      if (_editedMaterial.id != null) {
        print('update');
        materialManager.updateMaterial(_editedMaterial);
      } else {
        print("addd");
        materialManager.addMaterial(_editedMaterial);
      }
    } catch (err) {
      print(err);
      await showErrorDialog(context, 'Something went wrong!');
    }
    setState(() {
      _isLoading = false;
    });
    if (mounted) {
      Navigator.of(context).pop();
    }
  }
}
