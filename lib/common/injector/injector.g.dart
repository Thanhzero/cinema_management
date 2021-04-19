// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureBlocs() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => LoaderBloc());
    container.registerSingleton((c) => SnackbarBloc());
    container.registerSingleton((c) => EventBusBloc());
  }

  @override
  void _configureUsecases() {}
  @override
  void _configureRepositories() {}
  @override
  void _configureDataSources() {}
  @override
  void _configureLocalDataSources() {}
  @override
  void _configureCommon() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => NetworkInfoImpl());
  }
}
