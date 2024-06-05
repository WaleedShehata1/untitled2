import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/request_model.dart';

class CardNotification extends StatelessWidget {
  final RequestModelAssistant dateRequest;
  const CardNotification({super.key, required this.dateRequest});

  @override
  Widget build(BuildContext context) {
    CollectionReference DataDocMessageFireStore =
        FirebaseFirestore.instance.collection('assistants_info');
    return FutureBuilder<DocumentSnapshot>(
        future: DataDocMessageFireStore.doc(dateRequest.assistantId).get(),
        builder: (context, snap) {
          late Map<String, dynamic> data =
              snap.data?.data() as Map<String, dynamic>;
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ListTile(
                leading: SizedBox(
                  width: 55,
                  height: 55,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(data["imageUrl"], fit: BoxFit.cover),
                  ),
                ),
                title: Column(
                  children: [
                    Text(data["userName"]),
                    Text(dateRequest.address),
                    Text(dateRequest.message),
                  ],
                ),
                trailing: Text(
                  _getStatusText(dateRequest.state),
                  style: TextStyle(
                    fontSize: 18,
                    color: _getStatusColor(dateRequest.state),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
      case 'wating':
        return 'wating';
      case 'Accepted':
        return 'Accepted';
      case 'Rejected':
        return 'Rejected';
      default:
        return '';
    }
  }
}
