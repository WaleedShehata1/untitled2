// ignore_for_file: camel_case_types, file_names
import 'package:flutter/material.dart';
import 'package:untitled/madules/splash/s_splashScreans.dart';
import '../../const/images/image.dart';
import '../../shared/componente.dart';
import '../Register/who.dart';
import 'f_splashScrean.dart';

class th_splashScrean extends StatelessWidget {
  static String id = "th_splashScrean";
  const th_splashScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImagePath.sSplash),
                  fit: BoxFit.cover,
                ),
              )),
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
            padding: EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    width: 300,
                    child: Text(
                      'Fast service,immediate ambulanc service at reasonable prices ',
                      overflow: TextOverflow
                          .ellipsis, // استخدم النقاط المعلقة في حالة التجاوز
                      maxLines: 4,
                      style: TextStyle(fontSize: 20, color: defultColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 100.0,
              right: 16.0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const whoscrean()));
                },
                child: Container(
                  width: 180,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: defultColor),
                  child: const Center(
                    child: Text(
                      'Join A Community',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              )),
          Positioned(
            left: 70,
            bottom: 30,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const f_splashScrean()));
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
              onTap: () {},
              child: Container(
                width: 35,
                height: 12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: defultColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
