
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/core/mec_wrapper.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/root/root_authentication_screen.dart';
import 'package:flutter_app_interview/utils/mec_route_names.dart';

class AuthenWrapper extends MECWrapper {

  @override
  Route generateRoutes(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case MECRouteNames.ROOT: return MaterialPageRoute(settings: routeSettings, builder: (_) => RootAuthenticationScreen());
      default: return null;
    }
  }

  @override
  String get initialRoute => MECRouteNames.ROOT;

}