import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rubber/rubber.dart';

import 'auto_size_widget.dart';

const zero = 0.0001;

abstract class RubberAutoSizeStateCalculate extends State<RubberAutoSize>
    with SingleTickerProviderStateMixin {
  BottomSheetThemeData theme;

  GlobalObjectKey keyHeader;
  GlobalObjectKey keyContent;

  RubberAnimationController animationController;
  ScrollController scrollController;

  double headerHeight = 0;
  double contentHeight = 0;
  double maxHeight = 0;
  double insetBottom;

  @override
  void initState() {
    super.initState();
    insetBottom = widget.insets.bottom;

    animationController = RubberAnimationController(
      vsync: this,
      halfBoundValue: AnimationControllerValue(percentage: zero),
      lowerBoundValue: AnimationControllerValue(percentage: zero),
      duration: const Duration(milliseconds: 200),
      initialValue: zero,
    );
    detectClosed();
  }

  void detectClosed() {
    double currentValue = zero;
    var isClosed = false;
    animationController.addListener(() {
      final minValue = animationController.lowerBound + zero;
      final isLower = animationController.value <= minValue;
      final isDown = currentValue > animationController.value;

      if (isDown && isLower) {
        animationController.stop();
        animationController.animationState.value = AnimationState.collapsed;

        if (!isClosed) {
          WidgetsBinding.instance
              .addPostFrameCallback((_) => widget.onClosed?.call());
          isClosed = true;
        }
      } else if (!isLower) {
        isClosed = false;
      }
      currentValue = animationController.value;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (requestLayout()) {
        setState(() {
          animationController.halfExpand();
        });
      }
    });
  }

  @override
  void dispose() {
    scrollController?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(RubberAutoSize oldWidget) {
    neededLayout();
    super.didUpdateWidget(oldWidget);
  }

  bool requestLayout({bool force = false}) {
    final media = MediaQuery.of(context);
    final screenHeight = media.size.height;

    final headerHeight = widget.header != null ? _heightOfKey(keyHeader) : 0.0;
    final contentHeight = widget.content != null
        ? (() {
            if (!scrollController.hasClients) {
              return 0.0;
            }
            final position = scrollController?.position;
            return position.maxScrollExtent + position.extentInside;
          })()
        : 0.0;

    final maxHeight = min(
      headerHeight + contentHeight,
      screenHeight - insetBottom - widget.insets.top,
    );

    final changed = [
      !force,
      headerHeight == this.headerHeight,
      contentHeight == this.contentHeight,
      maxHeight == this.maxHeight
    ].indexOf(false);
    if (changed == -1) {
      return false;
    }

    final upper = maxHeight + insetBottom;
    final half =
        widget.split ? headerHeight + insetBottom + widget.offsetHeader : upper;

    animationController
      ..lowerBoundValue.pixel = max(insetBottom, zero)
      ..halfBoundValue.pixel = half
      ..upperBoundValue.pixel = upper
      ..height = screenHeight
      ..pixelValuesToPercentage();

    this.headerHeight = headerHeight;
    this.contentHeight = contentHeight;
    this.maxHeight = maxHeight;
    return true;
  }

  void neededLayout({bool force = false, VoidCallback changed}) {
    if (!force && animationController.status != AnimationStatus.completed) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (requestLayout(force: force)) {
        setState(() {});
        switch (animationController.animationState.value) {
          case AnimationState.expanded:
            animationController.expand();
            break;
          case AnimationState.half_expanded:
            animationController.halfExpand();
            break;
          case AnimationState.collapsed:
            animationController.halfExpand();
            break;
          default:
            break;
        }
        changed?.call();
      }
    });
  }

  double _heightOfKey(GlobalKey key) {
    final RenderBox box = key.currentContext.findRenderObject();
    return box.size.height;
  }
}
