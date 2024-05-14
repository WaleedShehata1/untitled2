// ignore_for_file: body_might_complete_normally_catch_error, use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helper/snackBar.dart';
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
    required String name,
    required String phone,
    required String email,
    required String uId,
    required String address,
  }) {
    UserModel model = UserModel(
      email: email,
      phone: phone,
      name: name,
      uId: uId,
      address: address,
    );
    FirebaseFirestore.instance
        .collection('patients')
        .doc(uId)
        .set(model.toFireStore())
        .then((value) {
      emit(UserCreateSuccessState(uId));
      print('Done =111111111111111111');
    }).catchError((error) {
      emit(UserCreateErrorState(error.toString()));
    });
  }

  void userSignUp({
    required String password,
    required String email,
    required String name,
    required String phone,
    required String address,
    required BuildContext context,
    required String routeName,
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
                  phone: phone,
                  email: email,
                  uId: value.user!.uid,
                  name: name,
                  address: address,
                ),
                showSnackbar(context, 'Success'),
                print('Success'),
                Navigator.pushReplacementNamed(context, routeName)
              })
          .catchError((error) {
        emit(RegisterErrorState(error: error.toString()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackbar(context, 'The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackbar(context, 'The account already exists for that email.');
        print('The account already exists for that email.');
      }
    } catch (e) {
      showSnackbar(context, e.toString());
      print(e);
    }
    isLoading = false;
  }
}
