import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../cubit/update_request/update_request_cubit.dart';

class CardRequests extends StatelessWidget {
  CardRequests({
    super.key,
    required this.doc,
    required this.address,
    required this.message,
    required this.state,
    required this.onTapAccepted,
    required this.onTapRejected,
  });
  final String doc;
  final void Function()? onTapRejected;
  final void Function()? onTapAccepted;
  final String address;
  final String message;
  final String state;
  CollectionReference DataDocMessageFireStore =
      FirebaseFirestore.instance.collection('patients_info');
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: DataDocMessageFireStore.doc(doc).get(),
      builder: (ctx, snapshot) {
        Map<String, dynamic> data = {};
        if (snapshot.hasData) {
          data = snapshot.data?.data() as Map<String, dynamic>;
        }

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
                          child: snapshot.hasData
                              ? Image.network(data['imageUrl'],
                                  fit: BoxFit.cover)
                              : Image.asset("assets/images/doctor.png",
                                  fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Column(
                        children: [
                          Text(snapshot.hasData
                              ? data['userName']
                              : "user Name"),
                          Text(snapshot.hasData ? address : "user address"),
                          Text(snapshot.hasData ? message : "user message"),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: onTapRejected,
                        child: const Text(
                          "Rejected",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: onTapAccepted,
                        child: const Text(
                          "Accepted",
                          style: TextStyle(
                            color: Colors.green,
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
