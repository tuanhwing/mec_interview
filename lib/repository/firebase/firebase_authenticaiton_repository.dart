

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_interview/core/network/mec_response.dart';
import 'package:flutter_app_interview/models/mec_user_model.dart';
import 'package:flutter_app_interview/repository/mec_authentication_repository.dart';
import 'package:flutter_app_interview/core/extension/mec_string_extension.dart';

class FirebaseAuthenticationRepository extends MECAuthenticationRepository {
  @override
  Future<MECResponse<MECUserModel>> checkLocalSession() async {
    User user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return MECResponse(
        code: MECResponseCode.SUCCESS,
        data: MECUserModel(
          displayName: user.displayName,
          email: user.email,
          phoneNumber: user.phoneNumber,
          photoURL: user.photoURL
        )
      );
    }
    return MECResponse(
      code: MECResponseCode.SYSTEM_ERROR,
    );
  }

  @override
  Future<MECResponse<MECUserModel>> login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return MECResponse<MECUserModel>(
        code: MECResponseCode.SUCCESS,
        data: MECUserModel(
          displayName: userCredential.user.displayName,
          email: userCredential.user.email,
          phoneNumber: userCredential.user.phoneNumber,
          photoURL: userCredential.user.photoURL,
        )
      );
    } on FirebaseAuthException catch (e) {
      return MECResponse<MECUserModel>(
        code: MECResponseCode.SYSTEM_ERROR,
        message: tr('user_name').capitalize + " " + tr('or') + " " + tr('password') + " " + tr('incorrect') + "!"
      );

    }
  }

  @override
  Future<MECResponse> logout() async {

  }

  @override
  Future<MECResponse> register(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return MECResponse(code: MECResponseCode.SUCCESS);
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return MECResponse(
            code: MECResponseCode.SYSTEM_ERROR,
            message: tr('password_too_weak').capitalize + "!"
        );
      }
      else if (e.code == 'email-already-in-use') {
        return MECResponse(
            code: MECResponseCode.SYSTEM_ERROR,
            message: tr('user_is_exists').capitalize + "!"
        );
      }
    } catch (e) {
      return MECResponse(
          code: MECResponseCode.SYSTEM_ERROR,
          message: tr('something_went_wrong').capitalize + "!"
      );
    }
    return MECResponse(
        code: MECResponseCode.SYSTEM_ERROR,
        message: tr('something_went_wrong').capitalize + "!"
    );
  }

}