// ignore_for_file: camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/register/register_cubit.dart';
import '../../shared/componente.dart';
import '../Login/d_Login.dart';

class r_doctor extends StatefulWidget {
  const r_doctor({super.key});
  static const String id = "r_doctor";
  @override
  State<r_doctor> createState() => _r_doctorState();
}

class _r_doctorState extends State<r_doctor> {
  final List<String> items = ['عنصر 1', 'عنصر 2', 'عنصر 3', 'عنصر 4'];
  bool isChecked = false;
  String selectedItem = 'عنصر 1';

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    var addressController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: defultColor,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    logo,
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'creating an account',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 15.0),
                          labelStyle: TextStyle(color: Colors.grey[600]),
                          labelText: 'Full name',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: TextFormField(
                        controller: addressController,
                        validator: (date) {
                          if (date!.trim().isEmpty) {
                            return 'Enter your address ';
                          }
                        },
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 15.0),
                          labelStyle: TextStyle(color: Colors.grey[600]),
                          labelText: 'Address',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 15.0),
                            labelStyle: TextStyle(color: Colors.grey[600]),
                            labelText: 'Valid email',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 15.0),
                            labelStyle: TextStyle(color: Colors.grey[600]),
                            labelText: 'Phone number',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                    ),
                    SizedBox(
                        height: 75,
                        child: PasswordTextField(
                          controller: null,
                          validator: (value) {},
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0)),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            counterStyle: const TextStyle(
                              fontSize: 13,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            labelStyle: const TextStyle(
                                color: defultColor, fontSize: 16),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              borderSide: const BorderSide(
                                  color: defultColor, width: 2),
                            ),
                            errorMaxLines: 2,
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  width: 2.0, color: Colors.red),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  width: 2.0, color: Colors.red),
                            ),
                          ),
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 154),
                            child: Icon(Icons.arrow_drop_down,
                                color: Colors.grey[600]),
                          ),
                          style: const TextStyle(fontSize: 18.0),
                          value: selectedItem,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              selectedItem = newValue;
                            }
                          },
                          items: items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                '   Specialty',
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.grey[600]),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            RegisterCubit.get(context).userSignUp(
                              password: passwordController.text,
                              email: emailController.text,
                              userName: nameController.text,
                              phone: phoneController.text,
                              collection: "patients",
                              context: context,
                              address: addressController.text,
                              routeName: d_login.id,
                            );
                          }
                          if (kDebugMode) {
                            print('Done');
                          }
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(color: defultColor),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already a member?',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const d_login()));
                            },
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              backgroundColor: defultColor,
            ),
          );
        },
      ),
    );
  }
}
