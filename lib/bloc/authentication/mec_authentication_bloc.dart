

import 'dart:convert';

import 'package:flutter_app_interview/bloc/authentication/mec_authentication_event.dart';
import 'package:flutter_app_interview/bloc/authentication/mec_authentication_state.dart';
import 'package:flutter_app_interview/core/enum/mec_authentication_status.dart';
import 'package:flutter_app_interview/core/network/mec_response.dart';
import 'package:flutter_app_interview/models/mec_user_model.dart';
import 'package:flutter_app_interview/repository/mec_authentication_repository.dart';
import 'package:flutter_app_interview/utils/mec_defines.dart';
import 'package:flutter_app_interview/utils/mec_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MECAuthenticationBloc extends Bloc<MECAuthenticationEvent, MECAuthenticationState>{
  MECAuthenticationBloc(this._authenticationRepository) : super(const MECAuthenticationState());


  final MECAuthenticationRepository _authenticationRepository;

  @override
  Stream<MECAuthenticationState> mapEventToState(MECAuthenticationEvent event) async* {
    if (event is MECAuthenticationStatusChanged) {
      yield await _mapStatusChangedToState(event.status, user: event.user);
    } else if (event is MECAuthenticationLogoutRequested) {
      yield await _logout(MECAuthenticationStatus.unauthenticated);
    } else if (event is MECAuthenticationTokenExpired) {
      yield await _logout(MECAuthenticationStatus.session_expired);
    } else if (event is MECAuthenticationCheckSession) {
      yield await _checkUserSession();
    }
  }

  Future<MECAuthenticationState> _logout(MECAuthenticationStatus status) async {
    await _authenticationRepository.logout();
    return MECAuthenticationState(status: status, user: MECUserModel());
  }

  Future<MECAuthenticationState> _mapStatusChangedToState(MECAuthenticationStatus status, {MECUserModel user}) async {
    if (status == MECAuthenticationStatus.authenticated && user != null) {
      String data = json.encode(user.toJson());
      await MECUtils.saveData(MECDefines.USER_INFO_KEY, data);
    }
    return MECAuthenticationState(status: status, user: user);
  }

  Future<MECAuthenticationState> _checkUserSession() async {

    MECResponse<MECUserModel> response = await _authenticationRepository.checkLocalSession();

    if (response.code == MECResponseCode.SUCCESS) {
      return MECAuthenticationState(
          status: MECAuthenticationStatus.authenticated, user: response.data);
    }

    return MECAuthenticationState(status: MECAuthenticationStatus.unauthenticated, user: MECUserModel());
  }

}