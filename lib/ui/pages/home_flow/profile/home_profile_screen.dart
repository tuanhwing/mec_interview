
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/bloc/authentication/mec_authentication_bloc.dart';
import 'package:flutter_app_interview/bloc/authentication/mec_authentication_event.dart';
import 'package:flutter_app_interview/core/mec_page_state.dart';
import 'package:flutter_app_interview/ui/common/mec_button.dart';
import 'package:flutter_app_interview/ui/common/mec_single_text.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/profile/bloc/home_profile_bloc.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/profile/bloc/home_profile_event.dart';
import 'package:flutter_app_interview/utils/mec_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_interview/core/extension/mec_string_extension.dart';

class HomeProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeProfileState();

}

class _HomeProfileState extends MECPageState<HomeProfileBloc, HomeProfileScreen> {

  @override
  // TODO: implement content
  Widget get content => SafeArea(
    child: Padding(
      padding: EdgeInsets.all(2*MECDimensions.DIMENSION_8),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                children: [
                  MECSingleText(
                    context.read<MECAuthenticationBloc>().state.user.displayName,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  MECSingleText(
                    context.read<MECAuthenticationBloc>().state.user.email,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ),
          MECButton(
            title: context.locale.languageCode.allInCaps,
            onPressed: () => bloc.add(ProfileChangeLanguageEvent())
          ),
          SizedBox(height: 2*MECDimensions.DIMENSION_8,),
          MECButton(
            title: tr('sign_out').allInCaps,
            onPressed: () => context.read<MECAuthenticationBloc>().add(MECAuthenticationLogoutRequested()),
          )
        ],
      ),
    ),
  );

}