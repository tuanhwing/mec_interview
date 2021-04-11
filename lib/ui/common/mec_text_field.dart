
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/utils/mec_colors.dart';
import 'package:flutter_app_interview/utils/mec_dimensions.dart';
import 'package:flutter_app_interview/utils/mec_fontsizes.dart';

class MECTextField extends StatelessWidget {
  MECTextField({this.onChanged, this.obscureText = false, this.hintText = "", this.errorString});
  final Function(String) onChanged;
  final bool obscureText;
  final String hintText;
  final String errorString;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        fontSize: MECFontSizes.SIZE_15,
        fontWeight: FontWeight.w400
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 52.0,
            child: TextField(
              onChanged: onChanged,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: hintText,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: errorString != null ? MECColors.red : MECColors.black,
                        width: MECDimensions.DIMENSION_2/2
                    )
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: errorString != null ? MECColors.red : MECColors.black,
                    width: MECDimensions.DIMENSION_2
                  )
                )
              ),
              cursorColor: MECColors.black,
            ),
          ),
          errorString != null ? Padding(
            padding: EdgeInsets.only(top: MECDimensions.DIMENSION_2),
            child: Text(
              errorString,
              style: TextStyle(
                color: MECColors.red,
                fontSize: MECFontSizes.SIZE_13
              ),
            ),
          ) : SizedBox()
        ],
      ),
    );
  }
}