import 'package:flutter/material.dart';
import 'package:myproject_app/ui/staff/staff_manager.dart';
import 'package:myproject_app/ui/staff/staff_screen.dart';
import 'package:provider/provider.dart';

import '../../models/staff.dart';
import '../../resource/dialog.dart';

class EditStaffScreen extends StatefulWidget {
  EditStaffScreen(
    Staff? staff, {
    super.key,
  }) {
    if (staff == null) {
      this.staff = Staff(
        id: null,
        name: '',
        address: '',
        phone: 0,
        email: '',
        avt: ''
      );
    } else {
      this.staff = staff;
    }
  }
  late final Staff staff;
  @override
  State<EditStaffScreen> createState() => _EditStaffScreenState();
}

class _EditStaffScreenState extends State<EditStaffScreen> {
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _editForm = GlobalKey<FormState>();
  late Staff _editedStaff;
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
    _editedStaff = widget.staff;
    _imageUrlController.text = _editedStaff.avt;
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
        title: const Text('Edit Staff'),
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
                    buildAddressField(),
                    buildPhoneField(),
                    buildEmailField(),
                    buildStaffPreview(),
                  ],
                ),
              ),
            ),
    );
  }

  TextFormField buildNameField() {
    return TextFormField(
      initialValue: _editedStaff.name,
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
        _editedStaff = _editedStaff.copyWith(name: value);
      },
    );
  }

  TextFormField buildAddressField() {
    return TextFormField(
      initialValue: _editedStaff.address,
      decoration: const InputDecoration(labelText: 'Address'),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide a value';
        }
        return null;
      },
      onSaved: (value) {
        _editedStaff = _editedStaff.copyWith(address: value);
      },
    );
  }

  TextFormField buildPhoneField() {
    return TextFormField(
      initialValue: _editedStaff.phone.toString(),
      decoration: const InputDecoration(labelText: 'Phone'),
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
        _editedStaff = _editedStaff.copyWith(phone: int.parse(value!));
      },
    );
  }
TextFormField buildEmailField(){
  return TextFormField(
      initialValue: _editedStaff.email,
      decoration: const InputDecoration(labelText: 'Email'),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide a value';
        }
        return null;
      },
      onSaved: (value) {
        _editedStaff = _editedStaff.copyWith(email: value);
      },
    );
}
  Widget buildStaffPreview() {
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
        _editedStaff = _editedStaff.copyWith(avt: value);
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
      final staffManager = context.read<StaffManager>();
      if (_editedStaff.id != null) {
        print('update');
        staffManager.updateStaff(_editedStaff);
      } else {
        print("addd");
        staffManager.addStaff(_editedStaff);
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
