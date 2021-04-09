
import 'dart:async';

import 'package:flutter_app_interview/core/network/mec_response.dart';
import 'package:flutter_app_interview/models/mec_user_model.dart';
import 'package:flutter_app_interview/utils/mec_defines.dart';
import 'package:flutter_app_interview/utils/mec_utils.dart';

abstract class MECAuthenticationRepository {
  MECAuthenticationRepository();

  ///Whether user is loggedin
  Future<MECResponse<MECUserModel>> checkLocalSession();

  ///Log-in
  /// @email : email
  /// @password : password
  Future<MECResponse<MECUserModel>> login(String email, String password);


  ///Register
  /// @email : email
  /// @password : password
  Future<MECResponse> register(String email, String password);


  ///Log-out
  Future<MECResponse> logout();
}