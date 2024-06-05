// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import '../../cubit/update_profile/update_profile_cubit.dart';
import '../../helper/shared.dart';
import '../../shared/componente.dart';
import '../../madules/Register/who.dart';

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
  final ImagePicker picker = ImagePicker();

  File? pickImage;

  String imageUrl = '';
  File? _image;
  bool _isEditing = false;
  XFile? image;

  fetchImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }
    setState(() {
      pickImage = File(image.path);
    });
    print("${pickImage?.path}");
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child("images");
    Reference referenceImagesToUpload =
        referenceDirImages.child(p.basename(pickImage!.path));
    try {
      await referenceImagesToUpload.putFile(pickImage!);
      imageUrl = await referenceImagesToUpload.getDownloadURL();
    } catch (e) {
      print("error=${e.toString()}---$e");
    }
    print("imageUrl=$imageUrl");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit()..getdate(),
      child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          print("aaa${UpdateProfileCubit().dataUser.toString()}");
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
                    onPressed: fetchImage,
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
                        Navigator.pushReplacementNamed(context, whoscrean.id)
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
