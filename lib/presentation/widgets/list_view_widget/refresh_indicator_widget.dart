import 'package:flutter/widgets.dart';
import 'package:flutter_cinema/common/constants/animation_constants.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshIndicatorWidget extends RefreshIndicator {
  @override
  _RefreshIndicatorWidgetState createState() => _RefreshIndicatorWidgetState();
}

class _RefreshIndicatorWidgetState
    extends RefreshIndicatorState<RefreshIndicatorWidget> {
  @override
  Widget buildContent(BuildContext context, RefreshStatus mode) {
    return Lottie.asset(
      AnimationConstants.pullRefresh,
      height: 60,
    );
  }
}
