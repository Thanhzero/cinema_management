import 'package:flutter/material.dart';

import 'auto_size_builder.dart';
export 'auto_size_builder.dart';

class RubberAutoSize extends StatefulWidget {
  final WidgetBuilder header;
  final ScrollableBuilder content;
  final VoidCallback onClosed;
  final VoidCallback requestClose;
  final EdgeInsets insets;
  final double offsetHeader;
  final bool split;
  final BottomSheetThemeData theme;

  RubberAutoSize({
    Key key,
    this.header,
    this.content,
    this.onClosed,
    this.requestClose,
    this.offsetHeader = 0,
    this.insets = const EdgeInsets.only(top: 50),
    this.theme,
    this.split = true,
  }) : super(key: key);

  @override
  RubberAutoSizeState createState() => RubberAutoSizeState();

  static RubberAutoSizeState of(BuildContext context) {
    return context.findAncestorStateOfType<RubberAutoSizeState>();
  }
}

typedef ScrollableBuilder = Widget Function(
  BuildContext context,
  ScrollController controller,
);
