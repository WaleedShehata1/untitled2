// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import '../../shared/componente.dart';

// ignore: camel_case_types
class p_dnotifications extends StatelessWidget {
  const p_dnotifications({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for demonstration
    List<Map<String, dynamic>> friendRequests = [
      {
        'name': 'Dr.hala Mohamed',
        'status': 'Accepted',
        'image': 'assets/images/doctor1.jpg'
      },
      {
        'name': 'Dr.jorg Mohamed',
        'status': 'Accepted',
        'image': 'assets/images/doctor2.jpg'
      },
      {
        'name': 'Dr.hend Mohamed',
        'status': 'Rejected',
        'image': 'assets/images/doctor3.jpg'
      },
    ];

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
          "Requests",
          style: TextStyle(color: defultColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: friendRequests.length,
        itemBuilder: (context, index) {
          final status = friendRequests[index]['status'];
          final statusColor = _getStatusColor(status);
          final alignment = _getAlignment(status);
          final oppositeAlignment = alignment == CrossAxisAlignment.start
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: ListTile(
                  leading: SizedBox(
                    width: 55,
                    height: 55,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(friendRequests[index]['image'],
                          fit: BoxFit.cover),
                    ),
                  ),
                  title: Column(
                    children: [
                      Text(friendRequests[index]['name']),
                      Text(friendRequests[index]['name']),
                      Text(friendRequests[index]['name']),
                    ],
                  ),
                  trailing: Text(
                    _getStatusText(status),
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
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
