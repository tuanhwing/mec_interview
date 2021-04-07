

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MECSplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MECSplashState();
}

class _MECSplashState extends State<MECSplashScreen> {

  @override
  void initState() {
    super.initState();
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