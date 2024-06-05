// ignore_for_file: camel_case_types

import 'dart:io';
import 'package:flutter/material.dart';

import '../../shared/componente.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _phoneEditingController = TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();

  bool _isEditing = false;
  File? _profileImageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
              width: 60,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: logo,
              ))
        ],
        backgroundColor: Colors.white54,
        automaticallyImplyLeading: false,
        title: const Text(
          "Profile",
          style: TextStyle(color: defultColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _profileImageFile != null
                ? CircleAvatar(
                    radius: 60,
                    backgroundImage: FileImage(_profileImageFile!),
                  )
                : const CircleAvatar(
                    radius: 60,
                    child: Icon(Icons.person),
                  ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey)),
              child: const Text(' Update the image'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (_isEditing)
                    IconButton(
                      icon: const Icon(Icons.check),
                      color: defultColor,
                      onPressed: () {
                        setState(() {
                          _isEditing = false;
                        });
                      },
                    ),
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
                    'Name',
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text(
                    'Phone Number',
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text(
                    'E-mail',
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text(
                    'Appointments',
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
                    style: const TextStyle(color: Colors.grey),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text(
                    'Price',
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
                    style: const TextStyle(color: Colors.grey),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text(
                    'Address',
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
                    style: const TextStyle(color: Colors.grey),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
