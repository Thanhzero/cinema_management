import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_cinema/presentation/bloc/loader_bloc/bloc.dart';

class MockLoaderBloc extends MockBloc<LoaderEvent, LoaderState>
    implements LoaderBloc {}
