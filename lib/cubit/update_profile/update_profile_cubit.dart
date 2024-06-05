import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/helper/shared.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());
  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  Future<void> updateUser() {
    CollectionReference users =
        FirebaseFirestore.instance.collection('patients_info');
    return users
        .doc('5ZHOdRscI9M3qFMF2IBNKGP9XNW2')
        .update({"lat": "1000", "log": '444524'})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> getdate() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('patients_info');
    users.doc('5ZHOdRscI9M3qFMF2IBNKGP9XNW2').get().then((value) {
      print("getdate=${value.data()}");
      return value;
    }).catchError((error) => print("Failed to update user: $error"));
  }
}
