
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_interview/utils/mec_dimensions.dart';
import 'package:flutter_app_interview/utils/mec_fontsizes.dart';

import 'mec_circle_image.dart';
import 'mec_single_text.dart';

class MECCardInfoWidget extends StatelessWidget {
  MECCardInfoWidget({this.imageURL, this.title, this.subTitle});
  final String imageURL;
  final String title;
  final String subTitle;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MECCircleImage(
          url: imageURL,
          size: 4*MECDimensions.DIMENSION_6,
        ),
        Padding(
          padding: const EdgeInsets.only(left: MECDimensions.DIMENSION_8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MECSingleText(
                title ?? "",
                style: TextStyle(
                    fontSize: MECFontSizes.SIZE_13,
                    fontWeight: FontWeight.w700
                ),
              ),
              MECSingleText(
                subTitle ?? "",
                style: TextStyle(
                    fontSize: MECFontSizes.SIZE_11,
                    fontWeight: FontWeight.w400
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}