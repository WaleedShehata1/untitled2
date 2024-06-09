// ignore_for_file: camel_case_types, duplicate_ignore

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../cubit/update_profile/update_profile_cubit.dart';
import '../../helper/shared.dart';
import '../../madules/Register/who.dart';
import '../../shared/componente.dart';
import 'package:path/path.dart' as p;

// ignore: camel_case_types
class aprofile extends StatefulWidget {
  const aprofile({super.key});

  @override
  State<aprofile> createState() => _aprofileState();
}

class _aprofileState extends State<aprofile> {
  bool _isEditing = false;
  final ImagePicker picker = ImagePicker();
  File? pickImage;
  String imageUrl = '';
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
      create: (context) => UpdateProfileCubit()..getdateDoctor(),
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
                      : UpdateProfileCubit.get(context).imageUrl != ''
                          ? SizedBox(
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: CircleAvatar(
                                  radius: 100,
                                  child: Image.network(
                                      UpdateProfileCubit.get(context).imageUrl),
                                ),
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
                  const SizedBox(height: 10),
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
                              UpdateProfileCubit.get(context)
                                  .updateAssistants();
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
                            controller: UpdateProfileCubit.get(context)
                                .userNameController,
                            enabled: _isEditing,
                            style: TextStyle(
                              color: _isEditing ? Colors.black : Colors.grey,
                            ),
                          ),
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
                            controller: UpdateProfileCubit.get(context)
                                .phoneEditingController,
                            enabled: _isEditing,
                            style: TextStyle(
                              color: _isEditing ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
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
                          controller: UpdateProfileCubit.get(context)
                              .priceEditingController,
                          enabled: _isEditing,
                          style: TextStyle(
                            color: _isEditing ? Colors.black : Colors.grey,
                          ),
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
}
