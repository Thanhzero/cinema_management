import 'package:dio/dio.dart';
import 'package:flutter_cinema/presentation/bloc/event_bus_bloc/bloc.dart';
import 'package:flutter_cinema/presentation/bloc/loader_bloc/bloc.dart';
import 'package:flutter_cinema/presentation/bloc/snackbar_bloc/bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:flutter_cinema/common/network/http/dio_config.dart';
import 'package:flutter_cinema/common/network/network_info.dart';

part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer container;

  static void setup({bool forTest = false}) {
    container = KiwiContainer();
    final injector = _$Injector();
    if (forTest) {
      injector._configureMock();
      return;
    }
    injector._configure();
  }

  void _configure() {
    _configureAppModule();
  }

  void _configureMock() {}

  void _configureAppModule() {
    _configureBlocs();
    _configureUsecases();
    _configureRepositories();
    _configureDataSources();
    _configureLocalDataSources();
    _configureCommon();
    _configureNetwork();
  }

// ============ BLOCS ============
  @Register.singleton(LoaderBloc)
  @Register.singleton(SnackbarBloc)
  @Register.singleton(EventBusBloc)
  void _configureBlocs();

// ============ USECASES ============
  void _configureUsecases();

// ============ REEPOSITORIES ============
  void _configureRepositories();

// ============ DATASOURCES ============
  void _configureDataSources();

  void _configureLocalDataSources();

// ============ COMMON ============
  @Register.factory(NetworkInfoImpl)
  void _configureCommon();

  // ============ NETWORK ============
  void _configureNetwork() {
    container.registerInstance(dio);
    container.registerInstance(dio, name: 'authentication');
  }
}
