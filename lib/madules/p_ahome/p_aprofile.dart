// ignore_for_file: use_key_in_widget_constructors, camel_case_types, non_constant_identifier_names

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../shared/componente.dart';

class p_aprofile extends StatefulWidget {
  @override
  State<p_aprofile> createState() => _p_aprofileState();
}

class _p_aprofileState extends State<p_aprofile> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _phoneEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();

  bool _isEditing = false;
  File? _p_aprofileImageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: const Icon(Icons.arrow_right),
              onPressed: () {
                Navigator.pop(context);
              },
              color: defultColor),
        ],
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          _p_aprofileImageFile != null
              ? CircleAvatar(
                  radius: 100,
                  backgroundImage: FileImage(_p_aprofileImageFile!),
                )
              : const CircleAvatar(
                  radius: 100,
                  child: Icon(Icons.person),
                ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              FilePickerResult? result =
                  await FilePicker.platform.pickFiles(type: FileType.image);
              if (result != null) {
                setState(() {
                  _p_aprofileImageFile = File(result.files.single.path!);
                });
              }
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)),
            child: const Text(' بتحديث الصورة'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      _isEditing = true;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Text(
                  'ألاسم',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: defultColor),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                      controller: _textEditingController,
                      enabled: _isEditing,
                      style: const TextStyle(color: Colors.grey)),
                ),
                if (_isEditing)
                  IconButton(
                    icon: const Icon(Icons.check),
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _isEditing = false;
                      });
                    },
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Text(
                  'رقم التليفون',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: defultColor),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                      controller: _phoneEditingController,
                      enabled: _isEditing,
                      style: const TextStyle(color: Colors.grey)),
                ),
                if (_isEditing)
                  IconButton(
                    icon: const Icon(Icons.check),
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _isEditing = false;
                      });
                    },
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Text(
                  'بريد إلكتروني',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: defultColor),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: TextField(
                  controller: _emailEditingController,
                  enabled: _isEditing,
                  style: const TextStyle(color: Colors.grey),
                )),
                if (_isEditing)
                  IconButton(
                    icon: const Icon(Icons.check),
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _isEditing = false;
                      });
                    },
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Text(
                  'كلمة المرور',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: defultColor),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: TextField(
                  controller: _passwordEditingController,
                  enabled: _isEditing,
                  style: const TextStyle(color: Colors.grey),
                )),
                if (_isEditing)
                  IconButton(
                    icon: const Icon(Icons.check),
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _isEditing = false;
                      });
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
