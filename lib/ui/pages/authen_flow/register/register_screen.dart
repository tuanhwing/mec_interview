
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/core/mec_page_state.dart';
import 'package:flutter_app_interview/ui/common/mec_button.dart';
import 'package:flutter_app_interview/ui/common/mec_text_field.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/authentication_content_widget.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/register/bloc/register_bloc.dart';
import 'package:flutter_app_interview/core/extension/mec_string_extension.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/register/bloc/register_event.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/register/bloc/register_state.dart';
import 'package:flutter_app_interview/utils/mec_colors.dart';
import 'package:flutter_app_interview/utils/mec_dimensions.dart';
import 'package:flutter_app_interview/utils/mec_fontsizes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends MECPageState<RegisterBloc, RegisterScreen> {

  TextSpan _buildTextSpan(String text, {VoidCallback onTap}) {
    return TextSpan(
      style: TextStyle(
        decoration: onTap != null ? TextDecoration.underline : TextDecoration.none,
        fontSize: MECFontSizes.SIZE_13,
        fontWeight: FontWeight.w400,
        color: MECColors.black,
      ),
      text: text,
      recognizer: TapGestureRecognizer()..onTap = onTap,
    );
  }

  @override
  Widget get content => AuthenticationContentWidget(
    title: tr('sign_up').capitalize,
    child: Column(
      children: [
        _RegisterUsernameWidget(),
        SizedBox(height: 2*MECDimensions.DIMENSION_8,),
        MECButton(
          title: tr('sign_up').allInCaps,
          type: MECButtonType.dark,
          onPressed: () => bloc.add(RegisterSubmitEvent()),
        ),
        SizedBox(height: 4*MECDimensions.DIMENSION_8,),
        DefaultTextStyle(
          style: TextStyle(
            color: MECColors.black
          ),
          child: RichText(
            text: TextSpan(
              children: [
                _buildTextSpan(tr('sign_up_explain').capitalize + " "),
                _buildTextSpan(tr('term_of_service').capitalizeFirstofEach, onTap: () {

                }),
                _buildTextSpan(" " + tr('and') + " "),
                _buildTextSpan(
                  tr('privacy_policy').capitalizeFirstofEach,
                  onTap: () {
                    // Single tapped.
                  }
                ),
              ]
            ),
          ),
        )
      ],
    ),
  );
}

class _RegisterUsernameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (_, state) {
        return MECTextField(
          hintText: tr('user_name').capitalize,
          onChanged: (text) => context.read<RegisterBloc>().add(RegisterUsernameChangedEvent(username: text)),
          errorString: state.email.invalid ? tr('invalid').capitalize : null,
        );
      },
    );
  }
}


