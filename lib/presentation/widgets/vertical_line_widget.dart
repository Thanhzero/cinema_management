import 'package:flutter/material.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';

class VerticalLine extends StatelessWidget {
  final double padding;
  final double height;
  final double thinkness;
  final Color color;
  final double indent;

  const VerticalLine({
    Key key,
    this.padding,
    this.height = 0,
    this.thinkness = 0.5,
    this.indent,
    this.color = AppColor.gray58,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: thinkness,
      color: color,
      indent: indent ?? padding,
      endIndent: padding,
    );
  }
}
