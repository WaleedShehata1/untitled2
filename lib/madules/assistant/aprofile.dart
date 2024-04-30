// ignore_for_file: camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';

import '../../shared/componente.dart';

// ignore: camel_case_types
class aprofile extends StatefulWidget {
  const aprofile({super.key});

  @override
  State<aprofile> createState() => _aprofileState();
}

class _aprofileState extends State<aprofile> {
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    'E-mail',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(defultColor)),
              child: const Text(
                'didagalal@gmail.com',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(defultColor)),
              child: const Text(
                'Yassa gamile',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    'Phone Number',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(defultColor)),
              child: const Text(
                '01012345678',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    'Pricing',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(defultColor)),
              child: const Text(
                '100\$',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    'Available Time',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(defultColor)),
              child: const Text(
                'Daily from 6 am to 10 pm',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}
