import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rubber/rubber.dart';

import 'auto_size_calculate.dart';

class RubberAutoSizeState extends RubberAutoSizeStateCalculate {
  Widget _buildHeader(BuildContext context) {
    if (widget.header == null) {
      return null;
    }
    if (keyHeader?.value != widget.header) {
      keyHeader = GlobalObjectKey(widget.header);
    }

    return Container(
      decoration: BoxDecoration(
        color: theme.backgroundColor ?? Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Wrap(
          key: ValueKey(keyHeader.hashCode),
          direction: Axis.horizontal,
          children: <Widget>[
            Builder(
              key: keyHeader,
              builder: widget.header,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (widget.content == null) {
      return null;
    }
    if (keyContent?.value != widget.content) {
      keyContent = GlobalObjectKey(widget.content);
      scrollController?.dispose();
      scrollController = ScrollController();
    }
    return Container(
      color: theme.backgroundColor ?? Colors.white,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Container(
          key: ValueKey(keyContent.hashCode),
          padding: EdgeInsets.only(bottom: insetBottom),
          child: Builder(
            key: keyContent,
            builder: (context) => _disableHalfScroll(
              context,
              widget.content(
                context,
                scrollController,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _bottom = MediaQuery.of(context).viewInsets.bottom;
    theme = widget.theme ?? Theme.of(context).bottomSheetTheme;

    if (insetBottom != _bottom) {
      insetBottom = _bottom;
      neededLayout(force: true);
    }

    return RubberBottomSheet(
      scrollController: scrollController,
      lowerLayer: Stack(
        children: <Widget>[
          _getOverlayWidget(),
          _getBackgroundLower(),
        ],
      ),
      animationController: animationController,
      headerHeight: headerHeight,
      header: _buildHeader(context),
      upperLayer: _buildContent(context),
    );
  }

  Widget _disableHalfScroll(BuildContext context, Widget child) {
    return Listener(
      onPointerDown: (evt) {
        if (widget.split &&
            animationController.animationState.value !=
                AnimationState.expanded) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            RubberBottomSheet.of(context, nullOk: true)?.forceScroll(false);
          });
        }
      },
      child: child,
    );
  }

  Widget _getOverlayWidget() {
    return InkWell(
      key: const ValueKey('RubberOverlay'),
      onTap: widget.requestClose ?? animationController.collapse,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget widget) {
          final opacity = min(
            animationController.value /
                (animationController.halfBound == zero
                    ? 1
                    : animationController.halfBound),
            1.0,
          );
          return Opacity(
            opacity: max(opacity, 0.0),
            child: Container(
              color: theme.modalBackgroundColor ?? Colors.black45,
            ),
          );
        },
      ),
    );
  }

  Widget _getBackgroundLower() {
    final screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, anim) {
          final headerPercent = (headerHeight - 1) / screenHeight;
          final height =
              (animationController.value - headerPercent) * screenHeight;
          return Container(
            color: Colors.white,
            height: max(height, 0),
          );
        },
      ),
    );
  }
}
