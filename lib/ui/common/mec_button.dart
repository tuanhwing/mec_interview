
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/ui/common/mec_single_text.dart';
import 'package:flutter_app_interview/utils/mec_colors.dart';
import 'package:flutter_app_interview/utils/mec_dimensions.dart';
import 'package:flutter_app_interview/utils/mec_fontsizes.dart';

enum MECButtonType {
  light, dark
}

class MECButton extends StatelessWidget {
  MECButton({this.title, this.type = MECButtonType.light, this.onPressed});
  final String title;
  final MECButtonType type;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 3*MECDimensions.DIMENSION_6),
        width: double.infinity,
        decoration: BoxDecoration(
          color: type == MECButtonType.light ? MECColors.white : MECColors.black,
          borderRadius: BorderRadius.circular(MECDimensions.DIMENSION_6),
          border: Border.all(
            color: type == MECButtonType.light ? MECColors.black : MECColors.white,
            width: MECDimensions.DIMENSION_2
          )
        ),
        child: Center(
          child: MECSingleText(
            title ?? "",
            style: TextStyle(
              fontSize: MECFontSizes.SIZE_13,
              fontWeight: FontWeight.w900,
              color: type == MECButtonType.light ? MECColors.black : MECColors.white
            ),
          ),
        ),
      ),
    );
  }
}