import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_cinema/presentation/bloc/snackbar_bloc/bloc.dart';

class MockSnackbarBloc extends MockBloc<SnackbarEvent, SnackbarState>
    implements SnackbarBloc {}
