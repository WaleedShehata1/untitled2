// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/madules/card_requests.dart';

import '../../shared/componente.dart';

// ignore: camel_case_types
class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for demonstrationCollectionReference doctorsFireStore =
    CollectionReference doctorsMessageFireStore =
        FirebaseFirestore.instance.collection('requests_doctor');

    return FutureBuilder<QuerySnapshot>(
        future: doctorsMessageFireStore.get(),
        builder: (context, snapshot) {
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
                "Messages",
                style:
                    TextStyle(color: defultColor, fontWeight: FontWeight.bold),
              ),
            ),
            body: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return CardRequests(
                  doc: snapshot.data!.docs[index]['userID'],
                );
              },
            ),
          );
        });
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Accepted':
        return Colors.green;
      case 'Rejected':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'Pending':
        return 'Pending';
      case 'Accepted':
        return 'Accepted';
      case 'Rejected':
        return 'Rejected';
      default:
        return '';
    }
  }

  CrossAxisAlignment _getAlignment(String status) {
    switch (status) {
      case 'Pending':
        return CrossAxisAlignment.start;
      case 'Accepted':
        return CrossAxisAlignment.end;
      case 'Rejected':
        return CrossAxisAlignment.start;
      default:
        return CrossAxisAlignment.start;
    }
  }
}
