

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/core/mec_wrapper.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/root/root_home_screen.dart';
import 'package:flutter_app_interview/utils/mec_route_names.dart';

class HomeWrapper extends MECWrapper {

  @override
  Route generateRoutes(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case MECRouteNames.ROOT: return MaterialPageRoute(settings: routeSettings, builder: (_) => RootHomeScreen());
      default: return null;
    }
  }

  @override
  String get initialRoute => MECRouteNames.ROOT;

}