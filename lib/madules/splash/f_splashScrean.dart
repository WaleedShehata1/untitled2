// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:untitled/const/images/image.dart';
import 'package:untitled/madules/splash/s_splashScreans.dart';
import 'package:untitled/madules/splash/th_splashScrean.dart';

import '../../shared/componente.dart';
import '../Register/who.dart';

class f_splashScrean extends StatelessWidget {
  const f_splashScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              ImagePath.fSplash,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const whoscrean()));
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                        color: defultColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'service for you',
                        style: TextStyle(
                            fontSize: 25,
                            color: defultColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Text(
                  'The service is suitable for all cases '
                  'and is provided by specialized experts',
                  maxLines: 2,
                  style: TextStyle(fontSize: 20, color: defultColor),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => s_splashScrean()));
              },
              backgroundColor: defultColor,
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 70,
            bottom: 30,
            child: Container(
              width: 35,
              height: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: defultColor,
              ),
            ),
          ),
          Positioned(
            left: 120,
            bottom: 30,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => s_splashScrean()));
              },
              child: Container(
                width: 35,
                height: 12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: const Color.fromRGBO(175, 196, 240, 1.0),
                ),
              ),
            ),
          ),
          Positioned(
            left: 170,
            bottom: 30,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const th_splashScrean()));
              },
              child: Container(
                width: 35,
                height: 12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: const Color.fromRGBO(175, 196, 240, 1.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
