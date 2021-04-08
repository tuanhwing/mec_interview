
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/utils/mec_colors.dart';
import 'package:flutter_app_interview/utils/mec_dimensions.dart';
import 'package:flutter_app_interview/utils/mec_fontsizes.dart';

class MECTextField extends StatelessWidget {
  MECTextField({this.onChanged, this.obscureText = false, this.hintText = ""});
  final Function(String) onChanged;
  final bool obscureText;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        fontSize: MECFontSizes.SIZE_15,
        fontWeight: FontWeight.w400
      ),
      child: SizedBox(
        width: double.infinity,
        height: 52.0,
        child: TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: MECColors.black,
                    width: MECDimensions.DIMENSION_2
                )
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MECColors.black,
                width: MECDimensions.DIMENSION_2
              )
            )
          ),
          cursorColor: MECColors.black,
        ),
      ),
    );
  }
}