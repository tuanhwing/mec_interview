

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/core/mec_hardware_back_observer.dart';
import 'package:flutter_app_interview/core/mec_navigator.dart';

class RootHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RootHomeState();
}
class _RootHomeState extends State<RootHomeScreen> implements MECHardwareBackListener  {

  @override
  void onTapBackPlatform() {
    MECNavigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    MECHardwareBackObserver().addListener(this);
  }

  @override
  void dispose() {
    MECHardwareBackObserver().removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('aaaaaaa'),
      ),
    );
  }

}