import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cinema/common/injector/injector.dart';
import 'package:flutter_cinema/common/utils/screen_utils.dart';
import 'package:flutter_cinema/presentation/route/route_constants.dart';
import 'package:flutter_cinema/presentation/route/routes.dart';
import 'package:flutter_cinema/presentation/theme/theme_data.dart';
import 'package:flutter_cinema/presentation/widgets/loader_widget/loader_widget.dart';
import 'package:flutter_cinema/presentation/widgets/snackbar_widget/snackbar_widget.dart';

import 'bloc/event_bus_bloc/event_bus_bloc.dart';
import 'bloc/loader_bloc/loader_bloc.dart';
import 'bloc/snackbar_bloc/bloc.dart';
import 'bloc/snackbar_bloc/snackbar_bloc.dart';

class App extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();

  App();

  List<BlocProvider> _getProviders() => [
        BlocProvider<LoaderBloc>(
            create: (BuildContext context) => Injector.container<LoaderBloc>()),
        BlocProvider<SnackbarBloc>(
            create: (BuildContext context) =>
                Injector.container<SnackbarBloc>()),
        BlocProvider<EventBusBloc>(
            create: (BuildContext context) =>
                Injector.container<EventBusBloc>())
      ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _getProviders(),
      child: MaterialApp(
        navigatorKey: _navigator,
        builder: (context, widget) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Builder(builder: (context) {
            ScreenUtil.init(context);
            return LoadingContainer(
              key: const ValueKey('LoadingContainer'),
              navigator: _navigator,
              child: _buildBlocListener(
                widget,
                context,
              ),
            );
          }),
        ),
        title: 'Phui +',
        theme: appTheme(context),
        onGenerateRoute: Routes.generateRoute,
        initialRoute: RouteList.initial,
      ),
    );
  }
  BlocListener<SnackbarBloc, SnackbarState> _buildBlocListener(
      Widget widget, BuildContext context) {
    return BlocListener<SnackbarBloc, SnackbarState>(
      listener: (context, state) {
        if (state is ShowSnackBarState) {
          TopSnackBar(
            title: state.title,
            type: state.type,
            key: state.key,
          ).showWithNavigator(_navigator.currentState, context);
        }
      },
      child: widget,
    );
  }
}
