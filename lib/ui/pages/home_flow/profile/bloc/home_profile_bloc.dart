

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_interview/bloc/mec_page_bloc.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/profile/bloc/home_profile_event.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/profile/bloc/home_profile_state.dart';
import 'package:flutter_app_interview/utils/mec_defines.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeProfileBloc extends MECPageBloc<HomeProfileEvent, HomeProfileState> {
  HomeProfileBloc(BuildContext context) : super(context, const HomeProfileState());

  @override
  Stream<HomeProfileState> mapEventToState(HomeProfileEvent event) async* {
    if (event is ProfileChangeLanguageEvent) {
      Locale locale = MECDefines.locales.first;
      if (context.locale.languageCode == locale.languageCode) {
        locale = MECDefines.locales.last;
      }
      context.setLocale(locale);
    }
  }

}