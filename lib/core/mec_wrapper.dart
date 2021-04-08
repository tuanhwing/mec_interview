

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_interview/core/mec_hardware_back_observer.dart';

abstract class MECWrapper extends StatelessWidget {

  String get initialRoute;
  Route generateRoutes(RouteSettings routeSettings);

  Future<bool> _onWillPop(BuildContext context) async {
    MECHardwareBackObserver().notify();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: Navigator(
          initialRoute: initialRoute,
          onGenerateRoute: generateRoutes,
        )
    );

  }
}