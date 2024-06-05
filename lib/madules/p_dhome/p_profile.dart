// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/madules/what_want/whowont.dart';

import '../../cubit/update_profile/update_profile_cubit.dart';
import '../../helper/shared.dart';
import '../../models/user_model.dart';
import '../../shared/componente.dart';

class p_profile extends StatefulWidget {
  const p_profile({super.key});

  @override
  State<p_profile> createState() => _p_profileState();
}

class _p_profileState extends State<p_profile> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _phoneEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  File? _image;
  bool _isEditing = false;
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(),
      child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
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
                style:
                    TextStyle(color: defultColor, fontWeight: FontWeight.bold),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  image != null
                      ? SizedBox(
                          width: 100,
                          height: 100,
                          child: CircleAvatar(
                            radius: 100,
                            backgroundImage:
                                FileImage(File(image!.path.toString())),
                          ),
                        )
                      : ClipRRect(
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey.withOpacity(0.4),
                            child: const Icon(
                              Icons.person,
                              size: 35,
                            ),
                          ),
                        ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: pickImage,
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
                              print(
                                  "data =${UpdateProfileCubit.get(context).getdate}");
                              setState(() {
                                _isEditing = false;
                              });
                            },
                          ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          color: Colors.black,
                          onPressed: () {
                            UpdateProfileCubit.get(context).updateUser();
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
                          decoration: const InputDecoration(),
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
                          'Password',
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
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                    width: 250,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: defultColor,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, whowant.id)
                            .then((value) => CacheHelper.clearData(
                                  key: 'token',
                                ));
                      },
                      child: const Text(
                        'Log out',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void pickImage() async {
    var images = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      image = images;
    });
    print(image!.path);
    print(image!.name);
    uploadImage();
  }

  void uploadImage() async {
    final FirebaseStorage fStorage =
        FirebaseStorage.instanceFor(bucket: "gs://sos1-84fac.appspot.com");
    var ref = fStorage.ref("${token}.jpg");
    ref.putFile(File(image!.path));
    print("${token}.jpg");
  }

  // Future<void> _pickImage() async {
  //   final XFile? image = await _picker.pickImage(source: ImageSource.camera);
  //   if (image != null) {
  //     setState(() {
  //       _image = File(image.path);
  //     });
  //     _uploadImageToFirebase(_image!);
  //   }
  // }

  // Future<void> _uploadImageToFirebase(File image) async {
  //   try {
  //     final storageRef = FirebaseStorage.instance.ref();
  //     final imagesRef = storageRef.child('images/${DateTime.now()}.jpg');
  //     await imagesRef.putFile(image);
  //     final downloadUrl = await imagesRef.getDownloadURL();
  //     print('Image uploaded: $downloadUrl');
  //   } catch (e) {
  //     print('Error uploading image: ${e.toString()}');
  //   }
  // }
}
