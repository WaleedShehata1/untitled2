class RequestModelDoctor {
  String userId;
  String doctorId;
  String address;
  String message;
  String state;

  RequestModelDoctor({
    required this.userId,
    required this.doctorId,
    required this.address,
    required this.message,
    required this.state,
  });

  RequestModelDoctor.fromFireStore(Map<String, dynamic> data)
      : this(
          userId: data['userId'],
          doctorId: data['doctorId'],
          address: data['address'],
          message: data['message'],
          state: data['state'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'userId': userId,
      'doctorId': doctorId,
      'address': address,
      'message': message,
      'state': state,
    };
  }
}
