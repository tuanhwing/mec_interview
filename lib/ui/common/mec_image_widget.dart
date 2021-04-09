

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/utils/mec_colors.dart';
import 'package:flutter_app_interview/utils/mec_dimensions.dart';

class MECImageWidget extends StatelessWidget {
  MECImageWidget({this.url, this.width, this.height});
  final String url;
  final double width;
  final double height;

  Widget _getContainer({Widget child}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(MECDimensions.DIMENSION_10)),
        color: MECColors.black.withOpacity(0.1),
      ),
      width: double.infinity,
      height: 2*MECDimensions.DIMENSION_10*MECDimensions.DIMENSION_10,

      child: child != null ? child : SizedBox(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? "",
      placeholder: (context, url) => _getContainer(),
      errorWidget: (context, url, error) => _getContainer(child: Icon(Icons.error)),
    );
  }
}