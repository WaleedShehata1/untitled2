class UserModel {
  String name;
  String phone;
  String email;
  String uId;
  String address;

  UserModel({
    this.uId = '',
    required this.email,
    required this.phone,
    required this.name,
    required this.address,
  });

  UserModel.fromFireStore(Map<String, dynamic> data)
      : this(
          uId: data['uId'],
          email: data['email'],
          name: data['name'],
          phone: data['phone'],
          address: data['Address'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'uId': uId,
      'email': email,
      'userName': name,
      'phone': phone,
      'address': address,
    };
  }
}
