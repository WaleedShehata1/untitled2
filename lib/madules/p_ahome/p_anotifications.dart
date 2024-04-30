// ignore_for_file: constant_identifier_names, use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';

enum FriendshipStatus {
  Accepted,
  Rejected,
  Pending,
}

class FriendRequest {
  final String name;
  final FriendshipStatus status;

  FriendRequest({required this.name, required this.status});
}

class p_anotifications extends StatelessWidget {
  final List<FriendRequest> friendRequests = [
    FriendRequest(name: 'Friend 1', status: FriendshipStatus.Accepted),
    FriendRequest(name: 'Friend 2', status: FriendshipStatus.Rejected),
    FriendRequest(name: 'Friend 3', status: FriendshipStatus.Pending),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friend Requests Sent'),
      ),
      body: ListView.builder(
        itemCount: friendRequests.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(friendRequests[index].name),
              trailing: _buildStatusWidget(friendRequests[index].status),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatusWidget(FriendshipStatus status) {
    switch (status) {
      case FriendshipStatus.Accepted:
        return const Icon(Icons.check, color: Colors.green);
      case FriendshipStatus.Rejected:
        return const Icon(Icons.close, color: Colors.red);
      case FriendshipStatus.Pending:
        return const Text('Pending');
      default:
        return Container();
    }
  }
}
