import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CardRequests extends StatelessWidget {
  CardRequests({super.key, required this.doc});
  final String doc;
  CollectionReference DataDocMessageFireStore =
      FirebaseFirestore.instance.collection('patients_info');
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: DataDocMessageFireStore.doc(doc).get(),
      builder: (context, snapshot) {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 55,
                        height: 55,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(data['imageUrl'],
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        children: [
                          Text(data['userName']),
                          Text(data['userName']),
                          Text(data['userName']),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Rejected",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Accepted",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
