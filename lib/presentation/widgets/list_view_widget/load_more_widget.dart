import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/constants/animation_constants.dart';
import 'package:lottie/lottie.dart';

class LoadMoreWidget extends StatefulWidget {
  final bool isLoading;

  const LoadMoreWidget({Key key, this.isLoading}) : super(key: key);

  @override
  _LoadMoreWidgetState createState() => _LoadMoreWidgetState();
}

class _LoadMoreWidgetState extends State<LoadMoreWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Offset> _offset;
  bool _isShow = false;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _offset = Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, 1.0))
        .animate(_animationController);
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isShow = widget.isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading != null) {
      if (widget.isLoading) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
    }
    return Visibility(
      visible: widget.isLoading != _isShow,
      child: SlideTransition(
        position: _offset,
        child: Center(
          child: Lottie.asset(
            AnimationConstants.loadMore,
            height: 40,
          ),
        ),
      ),
    );
  }
}
