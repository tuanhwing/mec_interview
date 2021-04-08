
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_interview/bloc/mec_page_bloc.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/register/bloc/register_event.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/register/bloc/register_state.dart';

class RegisterBloc extends MECPageBloc<RegisterEvent, RegisterState> {
  RegisterBloc(BuildContext context) : super(context, const RegisterState());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {

  }

}