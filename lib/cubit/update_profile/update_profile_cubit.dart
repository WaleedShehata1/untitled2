import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/helper/shared.dart';

import '../../models/request_model.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());
  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  Future<void> updateUser() {
    CollectionReference users =
        FirebaseFirestore.instance.collection('patients_info');
    return users
        .doc(token)
        .update({"lat": "1000", "log": '444524'})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

//---------------------------------------------------------
  Future<void> requestDoctors({
    required String userId,
    required String doctorId,
    required String address,
    required String message,
    required String state,
  }) async {
    CollectionReference requestsDoctor =
        FirebaseFirestore.instance.collection('requests_doctor');
    RequestModelDoctor request = RequestModelDoctor(
      userId: userId,
      address: address,
      doctorId: doctorId,
      message: message,
      state: state,
    );
    try {
      await requestsDoctor.add(request.toFireStore());
      print("User Updatedgg");
    } catch (e) {
      print("error request doctor = ${e.toString}");
    }
  }

//---------------------------------------------------------
  var dataUser;
  Future<void> requestAssistant({
    required String userId,
    required String assistantId,
    required String address,
    required String message,
    required String state,
  }) async {
    CollectionReference requestsDoctor =
        FirebaseFirestore.instance.collection('requests_assistant');
    RequestModelAssistant request = RequestModelAssistant(
      userId: userId,
      address: address,
      assistantId: assistantId,
      message: message,
      state: state,
    );
    try {
      await requestsDoctor.add(request.toFireStore());
      print("User Updatedggaa");
    } catch (e) {
      print("error request assistant = ${e.toString}");
    }
  }

  Future<void> getdate() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('patients_info');
    users.doc(CacheHelper.getData(key: "token")).get().then((value) {
      print(CacheHelper.getData(key: "token"));
      print("getdate=${value.data()}");
      dataUser = {
        "name": value["userName"],
        "email": value["email"],
        "phone": value["phone"]
      };
      return value;
    }).catchError((error) => print("Failed to update user: $error"));
  }
}
