

import 'package:flutter/cupertino.dart';

class MECCircleImage extends StatelessWidget {

  MECCircleImage({this.url, this.size});
  final String url;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        url,
        height: size,
        width: size,
        fit: BoxFit.cover,
      ),
    );
  }
}