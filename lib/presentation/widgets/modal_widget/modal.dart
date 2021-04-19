import 'package:flutter/material.dart';
import 'package:flutter_cinema/presentation/widgets/modal_widget/dialog_route_custome.dart';

class Modal<T> extends StatelessWidget {
  final BuildContext context;
  final String title;
  final ValueKey titleKey;
  final String description;
  final List<Widget> actions;
  final Widget imageWidget;
  final Key descriptionKey;
  final Function closeFunction;
  final bool isFixedHorizontalActions;
  final _actionButtonPadding = 18.0;
  final _barrierColor = Colors.black45;
  final _isOverlayTapDismiss = false;
  final _popUpDuration = const Duration(milliseconds: 150);
  final _heightFactor = 158.0;
  final _widthFactor = 270.0;
  final CrossAxisAlignment crossContentAlignment;
  final MainAxisAlignment mainAxisAlignmentRowActions;
  final String titleUnderImage;

  Modal({
    Key key,
    this.context,
    this.titleKey,
    this.title,
    @required this.description,
    this.descriptionKey,
    this.imageWidget,
    this.actions = const [],
    this.closeFunction,
    this.isFixedHorizontalActions = false,
    this.crossContentAlignment = CrossAxisAlignment.stretch,
    this.mainAxisAlignmentRowActions = MainAxisAlignment.start,
    this.titleUnderImage,
  }) : super(key: key);

  /// todo: displays defined modal
  Future<T> showModal() {
    final Future<T> generalDialog = showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return _buildModal(context);
      },
      useRootNavigator: false,
      barrierDismissible: _isOverlayTapDismiss,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: _barrierColor,
      transitionDuration: _popUpDuration,
    );
    return generalDialog;
  }

  Future<T> showWithNavigator(NavigatorState navigator) {
    return navigator.push<T>(DialogRouteCustomer<T>(
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return _buildModal(context);
      },
      barrierDismissible: _isOverlayTapDismiss,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: _barrierColor,
      transitionDuration: _popUpDuration,
    ));
  }

  Widget _buildModal(context) {
    return Center(
      widthFactor: _widthFactor,
      key: key,
      heightFactor: _heightFactor,
      child: SingleChildScrollView(
        child: AlertDialog(
          contentPadding: const EdgeInsets.all(16),
          title: title != null
              ? Text(
                  title,
                  key: titleKey,
                  style: Theme.of(context).textTheme.title.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.black),
                  textAlign: TextAlign.center,
                )
              : null,
          content: Column(
            crossAxisAlignment: crossContentAlignment,
            children: <Widget>[
              imageWidget ?? const SizedBox.shrink(),
              if (description?.isNotEmpty ?? false)
                Column(
                  key: const ValueKey('modal_description'),
                  children: <Widget>[
                    if (titleUnderImage != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          titleUnderImage,
                          style: Theme.of(context).textTheme.display2.copyWith(
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    Text(
                      description,
                      key: descriptionKey,
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: _actionButtonPadding),
                    ),
                  ],
                ),
              _renderBottomActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderBottomActions() {
    return isFixedHorizontalActions
        ? Row(
            mainAxisAlignment: mainAxisAlignmentRowActions,
            children: actions,
          )
        : ButtonBar(
            alignment: MainAxisAlignment.center,
            children: actions,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
