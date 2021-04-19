import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/navigation/custom_route.dart';

import '../navigation.dart';
import '../rubber_widget.dart';

void main() {
  CustomRoute.getPrefix(CustomRoutes.rubber).addAll({
    '/test': (settings) => RubberRouteExample(settings: settings),
  });
  return runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      home: RubberModalExample(),
      onGenerateRoute: CustomRoute.switcher,
    ),
  );
}

final Random random = Random();

List<Color> colors = [
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.blue,
  Colors.grey,
  Colors.greenAccent,
  Colors.blueGrey
];

double range(int from, int to) => (random.nextInt(to - from) + from) * 1.0;

class _SwitchHeight extends StatefulWidget {
  @override
  __SwitchHeightState createState() => __SwitchHeightState();
}

class __SwitchHeightState extends State<_SwitchHeight> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _RandomHeight(
          from: 100,
          to: 200,
          child: RaisedButton(
            onPressed: () {
              setState(() {});
            },
            child: const Text('Button'),
          ),
        ),
        Container(
          color: Colors.red,
          height: range(100, 2000),
        )
      ],
    );
  }
}

class RubberRouteExample extends RubberModalRoute {
  RubberRouteExample({RouteSettings settings}) : super(settings: settings);

  static int count = 0;

  void _pushNewSheet(BuildContext context) {
    Navigator.of(context).pushNamed(
      CustomRoute.nameWith(CustomRoutes.rubber, '/test'),
      arguments: {'num': count},
    );
    count++;
  }

  @override
  Widget buildHeader(BuildContext context) {
    return _RandomHeight(
      from: 60,
      to: 120,
      child: Row(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Pop'),
          ),
          RaisedButton(
            onPressed: () => _pushNewSheet(context),
            child: const Text('Push'),
          ),
          Expanded(
            child: TextFormField(),
          )
        ],
      ),
    );
  }

  @override
  Widget buildContent(
    BuildContext context,
    ScrollController controller,
  ) {
    return SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        child: _SwitchHeight());
  }
}

class RubberModalExample extends StatefulWidget {
  @override
  _RubberModalExampleState createState() => _RubberModalExampleState();
}

class _RubberModalExampleState extends State<RubberModalExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(context, RubberRouteExample());
              },
              child: const Text('default'),
            )
          ],
        ),
      ),
    );
  }
}

class _RandomHeight extends StatefulWidget {
  final int from;
  final int to;
  final Widget child;

  _RandomHeight({Key key, this.from, this.to, this.child}) : super(key: key);

  @override
  __RandomHeightState createState() => __RandomHeightState();
}

class __RandomHeightState extends State<_RandomHeight> {
  double _height;

  @override
  void initState() {
    _height = range(widget.from, widget.to);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      child: Center(
        child: widget.child,
      ),
    );
  }
}
