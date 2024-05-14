// ignore_for_file: camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit/register/register_cubit.dart';

import '../../shared/componente.dart';
import '../Login/a_Login.dart';

class r_assistant extends StatelessWidget {
  const r_assistant({super.key});
  static const String id = "r_assistant";
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
                        keyboardType: TextInputType.emailAddress,
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
                          ),
                        ),
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
                          ),
                        ),
                      ),
                    ),
                    PasswordTextField(
                      controller: null,
                      validator: (value) {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 5, bottom: 20),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 15.0),
                            labelStyle: TextStyle(color: Colors.grey[600]),
                            labelText: 'your jop',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white)),
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
                              routeName: a_login.id,
                            );
                          }
                          if (kDebugMode) {
                            print('Done');
                          }
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: defultColor),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already a member?',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const a_login(),
                                ),
                              );
                            },
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1)),
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
