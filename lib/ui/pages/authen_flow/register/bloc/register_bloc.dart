
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_interview/bloc/mec_page_bloc.dart';
import 'package:flutter_app_interview/bloc/mec_page_event.dart';
import 'package:flutter_app_interview/core/mec_navigator.dart';
import 'package:flutter_app_interview/core/network/mec_response.dart';
import 'package:flutter_app_interview/repository/mec_authentication_repository.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/register/bloc/register_event.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/register/bloc/register_state.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/supports/email_input.dart';
import 'package:flutter_app_interview/utils/mec_defines.dart';
import 'package:flutter_app_interview/utils/mec_utils.dart';
import 'package:formz/formz.dart';
import 'package:flutter_app_interview/core/extension/mec_string_extension.dart';

class RegisterBloc extends MECPageBloc<RegisterEvent, RegisterState> {
  RegisterBloc(BuildContext context, this._firebaseAuthenticationRepository) : super(context, const RegisterState());

  MECAuthenticationRepository _firebaseAuthenticationRepository;

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterUsernameChangedEvent) {
      yield _mapUsernameChangedToState(event);
    } else if (event is RegisterSubmitEvent) {
      _registerSubmit();
    }
  }

  RegisterState _mapUsernameChangedToState(RegisterUsernameChangedEvent event) {
    final email = EmailInput.dirty(value: event.username);
    return state.copyWith(
      email: email,
      status: Formz.validate([state.email, email]),
    );
  }

  void _registerSubmit() async {

    if (!state.status.isValidated) return;

    pageSTC.add(MECPageLoadingEvent());//Show loading
    MECResponse response = await _firebaseAuthenticationRepository.register(state.email.value, MECDefines.DEFAULT_PASSWORD);

    if (response.code == MECResponseCode.SUCCESS) {
      pageSTC.add(null);//Dismiss loading
      MECUtils.showNotifyDialog(
          context,
          message: tr('register').capitalize + " " + tr('success'),
          yes: () {
            MECNavigator.pop(context);
          }
      );
      return;
    }

    pageSTC.add(EOCPageErrorEvent(message: response.message));
  }

}