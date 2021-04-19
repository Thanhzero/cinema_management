import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetHeaderWidget extends StatelessWidget {
  final Widget extendContent;
  final Widget title;
  final Widget actions;
  final Widget leading;
  final Color backgroundColor;
  final EdgeInsets paddingContent;

  BottomSheetHeaderWidget({
    Key key,
    this.extendContent,
    this.leading,
    this.title,
    this.actions,
    this.backgroundColor,
    this.paddingContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: paddingContent ??
          EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                child: leading != null
                    ? InkWell(
                        onTap: () => {Navigator.of(context)?.pop()},
                        child: leading,
                      )
                    : null,
              ),
              Expanded(
                child: title,
              ),
              Container(
                child: actions,
              )
            ],
          ),
          Container(
            child: extendContent,
          )
        ],
      ),
    );
  }
}
