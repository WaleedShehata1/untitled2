// ignore_for_file: body_might_complete_normally_catch_error, use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/helper/snackBar.dart';
import 'package:untitled/madules/Login/p_Login.dart';

import '../../models/user_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  IconData? suffix = Icons.visibility_outlined;
  IconData? suffixConfirmPassword = Icons.visibility_outlined;

  bool isPassword = true;
  bool isConfirmPassword = true;
  bool isLoading = false;

  void showPassword() {
    isPassword = !isPassword;
    isConfirmPassword = !isConfirmPassword;

    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    suffixConfirmPassword = isConfirmPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ShowPassword());
  }

  void userCreate({
    required String userName,
    required String phone,
    required String email,
    required String uId,
    required String address,
    required String collection,
  }) {
    UserModel model = UserModel(
      email: email,
      phone: phone,
      name: userName,
      uId: uId,
      address: address,
    );
    FirebaseFirestore.instance
        .collection(collection)
        .doc(uId)
        .set(model.toFireStore())
        .then((value) {
      emit(UserCreateSuccessState(uId));
      print('Done =111111111111111111');
    }).catchError((error) {
      emit(UserCreateErrorState(error.toString()));
    });
  }

  Future<void> userSignUp({
    required String password,
    required String email,
    required String userName,
    required String phone,
    required String address,
    required String collection,
    required String routeName,
    required BuildContext context,
  }) async {
    isLoading = true;
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => {
                userCreate(
                  userName: userName,
                  phone: phone,
                  email: email,
                  uId: value.user!.uid,
                  collection: collection,
                  address: address,
                ),
                showSnackbar(context, 'Success'),
                print('Success'),
                Navigator.pushReplacementNamed(context, routeName)
              })
          .catchError((error) {
        emit(RegisterErrorState(error.toString()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackbar(context, 'The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackbar(context, 'The account already exists for that email.');
        print('The account already exists for that email.');
      } else {
        showSnackbar(context, e.toString());
        print("===${e.toString()}");
      }
    }
    isLoading = false;
  }
}
