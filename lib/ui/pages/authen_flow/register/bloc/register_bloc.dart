
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_interview/bloc/mec_page_bloc.dart';
import 'package:flutter_app_interview/bloc/mec_page_event.dart';
import 'package:flutter_app_interview/core/mec_navigator.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/register/bloc/register_event.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/register/bloc/register_state.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/supports/email_input.dart';
import 'package:flutter_app_interview/utils/mec_defines.dart';
import 'package:flutter_app_interview/utils/mec_utils.dart';
import 'package:formz/formz.dart';
import 'package:flutter_app_interview/core/extension/mec_string_extension.dart';

class RegisterBloc extends MECPageBloc<RegisterEvent, RegisterState> {
  RegisterBloc(BuildContext context) : super(context, const RegisterState());

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
    pageSTC.add(MECPageLoadingEvent());//Show loading
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: state.email.value,
          password: MECDefines.DEFAULT_PASSWORD
      );

      pageSTC.add(null);//Dismiss loading
      MECUtils.showNotifyDialog(
        context,
        message: tr('register').capitalize + " " + tr('success'),
        yes: () {
          MECNavigator.pop(context);
        }
      );

    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        pageSTC.add(EOCPageErrorEvent(message: tr('password_too_weak').capitalize + "!"));
      } else if (e.code == 'email-already-in-use') {
        pageSTC.add(EOCPageErrorEvent(message: tr('user_is_exists').capitalize + "!"));
      }
    } catch (e) {
      pageSTC.add(EOCPageErrorEvent(message: tr('something_went_wrong').capitalize + "!"));
      print(e);
    }
  }

}