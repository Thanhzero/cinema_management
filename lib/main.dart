import 'package:flutter/material.dart';
import 'package:flutter_cinema/presentation/app.dart';

import 'common/injector/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Injector.setup();
  runApp(App());
}