
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_interview/bloc/authentication/mec_authentication_bloc.dart';
import 'package:flutter_app_interview/bloc/authentication/mec_authentication_event.dart';
import 'package:flutter_app_interview/bloc/mec_page_bloc.dart';
import 'package:flutter_app_interview/bloc/mec_page_event.dart';
import 'package:flutter_app_interview/core/enum/mec_authentication_status.dart';
import 'package:flutter_app_interview/core/network/mec_response.dart';
import 'package:flutter_app_interview/models/mec_user_model.dart';
import 'package:flutter_app_interview/repository/mec_authentication_repository.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/login/bloc/login_event.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/login/bloc/login_state.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/supports/data_input.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/supports/email_input.dart';
import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends MECPageBloc<LoginEvent, LoginState> {
  LoginBloc(BuildContext context, this._firebaseAuthenticationRepository) : super(context, const LoginState());

  MECAuthenticationRepository _firebaseAuthenticationRepository;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
      if (event is LoginUserNameChangedEvent) {
        yield _mapUsernameChangedToState(event);
      }
      else if (event is LoginPasswordChangedEvent) {
        yield _mapPasswordChangedToState(event);
      }
      else if (event is LoginSubmitEvent) {
        _loginSubmit();
      }
  }

  LoginState _mapUsernameChangedToState(LoginUserNameChangedEvent event) {
    final email = EmailInput.dirty(value: event.email);
    return state.copyWith(
      email: email,
      status: Formz.validate([state.email, email]),
    );
  }

  LoginState _mapPasswordChangedToState(LoginPasswordChangedEvent event) {
    final password = DataInput.dirty(value: event.password);
    return state.copyWith(
      password: password,
      status: Formz.validate([state.password, password]),
    );
  }

  void _loginSubmit() async {
    if (!state.status.isValidated) return;

    pageSTC.add(MECPageLoadingEvent());//Show loading
    MECResponse<MECUserModel> response = await _firebaseAuthenticationRepository.login(state.email.value.trim(), state.password.value.trim());

    if(response.code == MECResponseCode.SUCCESS) {
      pageSTC.add(null);
      context.read<MECAuthenticationBloc>().add(MECAuthenticationStatusChanged(
          MECAuthenticationStatus.authenticated,
          user: response.data));
      return;
    }

    pageSTC.add(EOCPageErrorEvent(message: response.message));
  }
}