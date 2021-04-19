import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cinema/presentation/widgets/widget_utils.dart';
import 'package:rubber/rubber.dart';

import 'rubber_widget.dart';

class _ModalScopeStatus extends InheritedWidget {
  final RubberModalRoute route;

  const _ModalScopeStatus(
    this.route,
    Widget child,
  ) : super(child: child);

  @override
  bool updateShouldNotify(_ModalScopeStatus old) {
    return route.isCurrent;
  }
}

class RubberModalConfirmPopup {
  String title;
  String description;

  RubberModalConfirmPopup(this.title, this.description);

  RubberModalConfirmPopup.Default(BuildContext context) {
    // final i18n = S.of(context).translate;
    // title = i18n('common.modal.exitTitle');
    // description = i18n('common.modal.exitDescription');
    title = '123';
    description = '123';
  }
}

abstract class RubberModalRoute<T> extends OverlayRoute<T> {
  RubberModalRoute({RouteSettings settings}) : super(settings: settings);
  final double offsetHeader = 0;
  final bool split = true;

  RubberModalConfirmPopup requestConfirmClose;

  BuildContext context;

  static void clearAll(BuildContext context) {
    final navigator = Navigator.of(context);
    while (_routes.isNotEmpty) {
      navigator.removeRoute(_routes.last);
      _routes.removeLast();
    }
    _current = null;
    _currentEntry = null;
  }

  static final List<RubberModalRoute> _routes = [];
  static RubberModalRoute _current;
  static final GlobalKey _currentKey = GlobalKey();
  static OverlayEntry _currentEntry;

  static RubberModalRoute<T> of<T extends Object>(BuildContext context) {
    final _ModalScopeStatus widget =
        context.dependOnInheritedWidgetOfExactType<_ModalScopeStatus>();
    return widget?.route;
  }

  Future<bool> _collapse() async {
    final completer = Completer<bool>();
    final animController = _current?.getAnimationController();

    animController?.collapse()?.whenCompleteOrCancel(() {
      completer.complete(
          animController.animationState.value == AnimationState.collapsed);
    });
    return completer.future;
  }

  RubberAnimationController getAnimationController() {
    final RubberAutoSizeState state = _currentKey.currentState;
    return state.animationController;
  }

  @override
  void install() {
    _routes.add(this);
    super.install();
  }

  @override
  bool get willHandlePopInternally =>
      getAnimationController().animationState.value !=
          AnimationState.collapsed &&
      _routes.length == 1;

  @override
  bool didPop(T result) {
    if (willHandlePopInternally) {
      _collapse().then((value) => value ? navigator?.pop(result) : null);
      return false;
    }
    if (super.didPop(result)) {
      _routes.remove(this);
      if (_routes.isEmpty) {
        _current = null;
        _currentEntry = null;
      }
      return true;
    }
    return false;
  }

  Widget buildHeader(BuildContext context);

  Widget buildContent(BuildContext context, ScrollController controller);

  Widget _buildHeader(BuildContext context) {
    return _ModalScopeStatus(this, Builder(builder: buildHeader));
  }

  Widget _buildContent(BuildContext context, ScrollController controller) {
    return _ModalScopeStatus(
      this,
      Builder(builder: (context) => buildContent(context, controller)),
    );
  }

  Future<bool> requestClose() async {
    return confirmExitPopup(
      context: context,
      title: requestConfirmClose.title,
      description: requestConfirmClose.description,
    );
  }

  Future<bool> requestConfirm(String title, String description,
      String confirmText, VoidCallback onConfirm) async {
    return confirmExitPopup(
        context: context,
        title: title,
        description: description,
        confirmText: confirmText,
        onConfirm: onConfirm);
  }

  Future<bool> makeCloseAll([bool force = false]) async {
    if (force ||
        _current.requestConfirmClose == null ||
        await _current.requestClose()) {
      FocusScope.of(context).requestFocus(FocusNode());
      return _collapse().then((result) {
        if (result) {
          clearAll(context);
        }
        return result;
      });
    }
    return false;
  }

  @override
  Iterable<OverlayEntry> createOverlayEntries() {
    if (_currentEntry != null) {
      return [];
    }

    return [
      _currentEntry = OverlayEntry(builder: (BuildContext context) {
        _current = _routes.last..context = context;
        return Material(
          color: const Color(0x00000000),
          child: RubberAutoSize(
            key: _currentKey,
            onClosed: () async {
              if (_routes.isNotEmpty) {
                if (_current.requestConfirmClose != null) {
                  if (await _current.requestClose()) {
                    clearAll(context);
                  } else {
                    _current.getAnimationController().halfExpand(from: 0.00011);
                  }
                } else {
                  clearAll(context);
                }
              }
            },
            requestClose: _current.makeCloseAll,
            offsetHeader: _current.offsetHeader,
            split: _current.split,
            header: _current._buildHeader,
            content: _current._buildContent,
          ),
        );
      })
    ];
  }
}

class RubberModalRouteBuilder<T> extends RubberModalRoute<T> {
  final WidgetBuilder header;
  final ScrollableBuilder content;

  @override
  final double offsetHeader;

  RubberModalRouteBuilder({
    this.header,
    this.content,
    this.offsetHeader = 0,
    BottomSheetThemeData theme,
    RouteSettings settings,
    bool split,
  }) : super(
          settings: settings,
        );

  @override
  Widget buildHeader(BuildContext context) {
    return header != null ? header(context) : null;
  }

  @override
  Widget buildContent(BuildContext context, ScrollController controller) {
    return content != null ? content(context, controller) : Container();
  }
}

Future<T> showModalRubberBottomSheet<T>({
  @required BuildContext context,
  WidgetBuilder header,
  ScrollableBuilder content,
  double offsetHeader = 0,
  BottomSheetThemeData theme,
  bool useRootNavigator = false,
  Object arguments,
  bool split = true,
}) {
  return Navigator.of(
    context,
    rootNavigator: useRootNavigator,
  ).push(RubberModalRouteBuilder<T>(
    header: header,
    content: content,
    offsetHeader: offsetHeader,
    theme: theme,
    settings: RouteSettings(arguments: arguments),
    split: split,
  ));
}
