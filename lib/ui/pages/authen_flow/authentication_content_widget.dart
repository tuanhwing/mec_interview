

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/core/mec_navigator.dart';
import 'package:flutter_app_interview/ui/common/mec_single_text.dart';
import 'package:flutter_app_interview/utils/mec_dimensions.dart';

class AuthenticationContentWidget extends StatelessWidget {
  AuthenticationContentWidget({this.child, this.title});
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 2*MECDimensions.DIMENSION_8
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  MECNavigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MECDimensions.DIMENSION_8,
                    right: MECDimensions.DIMENSION_8,
                    bottom: 4*MECDimensions.DIMENSION_8,
                  ),
                  child: Icon(
                    Icons.undo_sharp,
                    size: MECDimensions.DIMENSION_11,
                  ),
                ),
              ),
              MECSingleText(
                title ?? "",
                style: Theme.of(context).textTheme.headline6,
              ),
              Padding(
                padding: EdgeInsets.only(top: 4*MECDimensions.DIMENSION_8),
                child: SingleChildScrollView(
                  child: child
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}