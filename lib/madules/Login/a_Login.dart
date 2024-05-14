// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

import '../../shared/componente.dart';
import '../Register/verify.dart';
import '../Register/who.dart';
import '../assistant/assistant.dart';

class a_login extends StatelessWidget {
  const a_login({super.key});
  static const String id = "a_login";
// TextEditingController name;
// TextEditingController
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 70,
          ),
          const Image(
            image: AssetImage(
              'assets/images/logo-1-sos.png',
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'sign in to access your account',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: TextFormField(
              // controller: ,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 15.0),
                labelStyle: TextStyle(
                  color: Colors.grey[600],
                ),
                labelText: 'Enter your email',
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
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const verify(),
                      ),
                    );
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 255, 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            height: 40,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const assistant(),
                  ),
                );
              },
              child: const Text('Log In'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'New Member?',
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const whoscrean(),
                      ),
                    );
                  },
                  child: const Text(
                    'Register now',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 255, 1),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      backgroundColor: defultColor,
    );
  }
}
