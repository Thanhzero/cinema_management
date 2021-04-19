import 'package:flutter/material.dart';

class DotIndicatorWidget extends StatelessWidget {
  final int totalItems;
  final int currentIndex;
  final double dotSize;
  final Color highlightColor;
  final Color color;
  final double spacing;

  const DotIndicatorWidget({
    Key key,
    this.totalItems,
    this.currentIndex = 0,
    this.dotSize,
    this.highlightColor,
    this.color,
    this.spacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildDotWidget(),
    );
  }

  List<Widget> _buildDotWidget() {
    final widgets = <Widget>[];
    for (var index = 0; index < totalItems; index++) {
      widgets.add(Container(
        width: dotSize,
        height: dotSize,
        margin: EdgeInsets.symmetric(horizontal: spacing),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentIndex == index ? highlightColor : color,
        ),
      ));
    }
    return widgets;
  }
}
