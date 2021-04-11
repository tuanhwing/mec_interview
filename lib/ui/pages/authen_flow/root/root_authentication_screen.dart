
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/core/mec_hardware_back_observer.dart';
import 'package:flutter_app_interview/core/mec_navigator.dart';
import 'package:flutter_app_interview/ui/common/mec_button.dart';
import 'package:flutter_app_interview/ui/common/mec_card_info_widget.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/login/login_screen.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/register/register_screen.dart';
import 'package:flutter_app_interview/utils/mec_defines.dart';
import 'package:flutter_app_interview/utils/mec_dimensions.dart';
import 'package:flutter_app_interview/utils/mec_fontsizes.dart';
import 'package:flutter_app_interview/utils/mec_mock_up.dart';
import 'package:flutter_app_interview/core/extension/mec_string_extension.dart';

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
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.asset(
                    MECDefines.IMAGES_ASSETS + 'Rectangle.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            tr('app_name'),
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: MECFontSizes.SIZE_48,
                              fontFamily: 'Comfortaa'
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4*MECDimensions.DIMENSION_5,
                          horizontal: 2*MECDimensions.DIMENSION_8
                        ),
                        child: MECCardInfoWidget(
                            imageURL: MECMockUp.AVATAR_IMAGE,
                            title: 'Pawel Czerwinski',
                            subTitle: '@pawel_czerwinski',
                        )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 4*MECDimensions.DIMENSION_5,
                horizontal: 2*MECDimensions.DIMENSION_8,
              ),
              child: Row(
                children: [
                  Flexible(
                    child: MECButton(
                      title: tr('log_in').allInCaps,
                      onPressed: () {
                        MECNavigator.pushRoute(
                          context,
                          MaterialPageRoute(builder: (_) => LoginScreen())
                        );
                      },
                    ),
                  ),
                  SizedBox(width: MECDimensions.DIMENSION_8,),
                  Flexible(
                    child: MECButton(
                      title: tr('register').allInCaps,
                      type: MECButtonType.dark,
                      onPressed: () {
                        MECNavigator.pushRoute(
                            context,
                            MaterialPageRoute(builder: (_) => RegisterScreen())
                        );
                      },
                    )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}