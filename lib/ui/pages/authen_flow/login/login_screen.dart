
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/core/mec_page_state.dart';
import 'package:flutter_app_interview/ui/common/mec_button.dart';
import 'package:flutter_app_interview/ui/common/mec_text_field.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/authentication_content_widget.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/login/bloc/login_bloc.dart';
import 'package:flutter_app_interview/core/extension/mec_string_extension.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/login/bloc/login_event.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/login/bloc/login_state.dart';
import 'package:flutter_app_interview/utils/mec_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();

}

class _LoginState extends MECPageState<LoginBloc, LoginScreen> {

  @override
  Widget get content => AuthenticationContentWidget(
    title: tr('log_in').capitalize,
    child: Column(
      children: [
        _UserNameLoginWidget(),
        SizedBox(height: 2*MECDimensions.DIMENSION_8,),
        _PasswordLoginWidget(),
        SizedBox(height: 2*MECDimensions.DIMENSION_8,),
        _LoginSubmitButton()
      ],
    ),
  );
}

class _UserNameLoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (_, state) {
        return MECTextField(
          hintText: tr('email').capitalize,
          onChanged: (text) => context.read<LoginBloc>().add(LoginUserNameChangedEvent(email: text)),
          errorString: state.email.invalid ? (tr("email").capitalize + ' ' + tr('invalid')) : null,
        );
      },
    );
  }
}

class _PasswordLoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (_, state) {
        return MECTextField(
          onChanged: (text) => context.read<LoginBloc>().add(LoginPasswordChangedEvent(password: text)),
          hintText: tr('password').capitalize,
          obscureText: true,
          errorString: state.password.invalid ? (tr('password').capitalize + ' ' + tr('invalid')) : null,
        );
      },
    );
  }

}

class _LoginSubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (_, state) {
        return MECButton(
          title: tr('log_in').allInCaps,
          type: MECButtonType.dark,
          onPressed: state.status.isValidated ? () { context.read<LoginBloc>().add(LoginSubmitEvent()); } : null,
        );
      },
    );
  }
}