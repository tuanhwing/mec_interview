import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/bloc/authentication/mec_authentication_bloc.dart';
import 'package:flutter_app_interview/bloc/bloc_factory.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/authen_wrapper.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/home_wrapper.dart';
import 'package:flutter_app_interview/ui/pages/mec_splash_screen.dart';
import 'package:flutter_app_interview/utils/mec_route_names.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/authentication/mec_authentication_state.dart';
import 'core/config/mec_config.dart';
import 'core/enum/mec_authenticaiton_status.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await EasyLocalization.ensureInitialized();

  runApp(BlocProvider(
    create: (_) => BlocFactory.of<MECAuthenticationBloc>(),
    child: EasyLocalization(
        useOnlyLangCode: true,
        supportedLocales: MECConfig.locales,
        fallbackLocale: MECConfig.locales.first,
        path: 'assets/langs',
        child: MyApp()
    ),
  ));
}

class MyApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        fontFamily: 'Roboto'
      ),
      builder: (_, child) {
        return BlocListener<MECAuthenticationBloc, MECAuthenticationState>(
          listener: (context, state) {
            switch(state.status) {
              case MECAuthenticationStatus.authenticated:
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      home: MECSplashScreen(),
      routes: {
        MECRouteNames.AUTHENTICATION_FLOW : (_) => AuthenWrapper(),
        MECRouteNames.HOME_FLOW : (_) => HomeWrapper()
      },
    );
  }
}


