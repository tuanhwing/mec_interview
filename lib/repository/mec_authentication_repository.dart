
import 'dart:async';

import 'package:flutter_app_interview/core/network/mec_response.dart';
import 'package:flutter_app_interview/models/mec_user_model.dart';
import 'package:flutter_app_interview/utils/mec_defines.dart';
import 'package:flutter_app_interview/utils/mec_utils.dart';

class MECAuthenticationRepository {
  MECAuthenticationRepository();

  ///Whether user is loggedin
  Future<MECResponse<MECUserModel>> checkLocalSession() async {
    Future.delayed(Duration(seconds: 1));
    return MECResponse(code: MECResponseCode.SUCCESS, data: MECUserModel(), message: "");
  }

  ///Log-in
  /// @phone : phone number
  Future<MECResponse<MECUserModel>> login(String phone, String token) async {
    Future.delayed(Duration(seconds: 1));
    return MECResponse(code: MECResponseCode.SUCCESS, data: MECUserModel(), message: "");
  }


  ///Log-out
  Future<MECResponse> logout() async {
    Future.delayed(Duration(seconds: 1));
    await MECUtils.deleteData(MECDefines.USER_INFO_KEY);
    await MECUtils.deleteData(MECDefines.TOKEN_KEY);
    await MECUtils.deleteData(MECDefines.REFRESH_TOKEN_KEY);
    return MECResponse(code: MECResponseCode.SUCCESS, data: null, message: "");
  }
}