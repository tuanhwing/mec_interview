

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/bloc/authentication/mec_authentication_bloc.dart';
import 'package:flutter_app_interview/bloc/authentication/mec_authentication_event.dart';
import 'package:flutter_app_interview/utils/mec_fontsizes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MECSplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MECSplashState();
}

class _MECSplashState extends State<MECSplashScreen> {

  void _handle() async {
    await Future.delayed(Duration(seconds: 1));
    context.read<MECAuthenticationBloc>().add(MECAuthenticationCheckSession());
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
        child: Text(
          tr('app_name'),
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: MECFontSizes.SIZE_48,
              fontFamily: 'Comfortaa'
          ),
        ),
      ),
    );
  }

}