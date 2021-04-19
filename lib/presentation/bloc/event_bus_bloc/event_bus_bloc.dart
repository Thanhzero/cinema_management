import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cinema/presentation/bloc/event_bus_bloc/bloc.dart';

class EventBusBloc extends Bloc<EventBusEvent, EventBusState> {
  @override
  EventBusState get initialState => InitState();

  @override
  Stream<EventBusState> mapEventToState(EventBusEvent event) async* {
    if (event is InitEvent) {
      yield* _mapInitEventToState(event);
    } else if (event is ReloadMatchEvent) {
      yield* _mapReloadMatchEventToState(event);
    } else if (event is ReloadTeamEvent) {
      yield* _mapReloadTeamEventToState(event);
    }
  }

  Stream<EventBusState> _mapInitEventToState(InitEvent event) async* {
    yield InitState();
  }

  Stream<EventBusState> _mapReloadMatchEventToState(
      ReloadMatchEvent event) async* {
    yield ReloadMatchState();
  }

  Stream<EventBusState> _mapReloadTeamEventToState(
      ReloadTeamEvent event) async* {
    yield ReloadTeamState();
  }
}
