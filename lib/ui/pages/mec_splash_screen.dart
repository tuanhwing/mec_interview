

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/core/mec_navigator.dart';
import 'package:flutter_app_interview/utils/mec_route_names.dart';

class MECSplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MECSplashState();
}

class _MECSplashState extends State<MECSplashScreen> {

  void _handle() async {
    await Future.delayed(Duration(seconds: 2));
    MECNavigator.pushReplacementNamed(context, MECRouteNames.AUTHENTICATION_FLOW);
  }

  @override
  void initState() {
    super.initState();
    _handle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }

}