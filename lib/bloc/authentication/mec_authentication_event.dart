

import 'package:equatable/equatable.dart';
import 'package:flutter_app_interview/core/enum/mec_authentication_status.dart';
import 'package:flutter_app_interview/models/mec_user_model.dart';

abstract class MECAuthenticationEvent extends Equatable {
  const MECAuthenticationEvent();

  @override
  List<Object> get props => [];
}

class MECAuthenticationStatusChanged extends MECAuthenticationEvent {
  const MECAuthenticationStatusChanged(this.status, {this.user});
  final MECAuthenticationStatus status;
  final MECUserModel user;

  @override
  List<Object> get props => [status, user];
}

class MECAuthenticationLogoutRequested extends MECAuthenticationEvent {

}

class MECAuthenticationTokenExpired extends MECAuthenticationEvent {
}

class MECAuthenticationCheckSession extends MECAuthenticationEvent {

}