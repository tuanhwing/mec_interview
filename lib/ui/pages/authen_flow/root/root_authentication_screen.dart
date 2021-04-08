
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/core/mec_hardware_back_observer.dart';

class RootAuthenticationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RootAuthenticationState();
}
class _RootAuthenticationState extends State<RootAuthenticationScreen> implements MECHardwareBackListener {

  @override
  void onTapBackPlatform() {

  }

  @override
  void initState() {
    super.initState();
    MECHardwareBackObserver().addListener(this);
  }

  @override
  void dispose() {
    super.dispose();
    MECHardwareBackObserver().removeListener(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('MEC selection'),
      ),
    );
  }
}