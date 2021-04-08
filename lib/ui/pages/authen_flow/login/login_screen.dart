
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/core/mec_page_state.dart';
import 'package:flutter_app_interview/ui/common/mec_button.dart';
import 'package:flutter_app_interview/ui/common/mec_text_field.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/authentication_content_widget.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/login/bloc/login_bloc.dart';
import 'package:flutter_app_interview/core/extension/mec_string_extension.dart';
import 'package:flutter_app_interview/utils/mec_dimensions.dart';

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
        MECTextField(
          hintText: tr('user_name').capitalize,
        ),
        SizedBox(height: 2*MECDimensions.DIMENSION_8,),
        MECTextField(
          hintText: tr('password').capitalize,
          obscureText: true,
        ),
        SizedBox(height: 2*MECDimensions.DIMENSION_8,),
        MECButton(
          title: tr('log_in').allInCaps,
          type: MECButtonType.dark,
          onPressed: () {},
        )
      ],
    ),
  );

}