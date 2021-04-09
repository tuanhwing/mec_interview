

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_interview/bloc/mec_page_bloc.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/login/bloc/login_event.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/login/bloc/login_state.dart';

class LoginBloc extends MECPageBloc<LoginEvent, LoginState> {
  LoginBloc(BuildContext context) : super(context, const LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }

}