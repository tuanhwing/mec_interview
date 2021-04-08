
import 'package:flutter/cupertino.dart';

class MECSingleText extends StatelessWidget {
  MECSingleText(this.text, {this.style, this.textAlign});
  final TextStyle style;
  final String text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text ?? "",
      style: this.style,
      textAlign: textAlign,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}