import 'package:flutter/material.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';

class CustomCircleProgress extends StatelessWidget {
  final double size;

  CustomCircleProgress({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 40,
      height: size ?? 40,
      child: Padding(
          padding: const EdgeInsets.all(7),
          child: Theme(
            data:
                Theme.of(context).copyWith(accentColor: AppColor.primaryColor),
            child: const CircularProgressIndicator(
              strokeWidth: 2,
            ),
          )),
    );
  }
}
