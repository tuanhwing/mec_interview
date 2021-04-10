
import 'package:equatable/equatable.dart';
import 'package:flutter_app_interview/core/enum/mec_authentication_status.dart';
import 'package:flutter_app_interview/models/mec_user_model.dart';

class MECAuthenticationState extends Equatable {
  const MECAuthenticationState({this.status, this.user});
  final MECAuthenticationStatus status;
  final MECUserModel user;

  @override
  List<Object> get props => [status, user];
}