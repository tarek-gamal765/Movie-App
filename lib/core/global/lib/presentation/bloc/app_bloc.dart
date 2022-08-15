import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    setState();
  }

  GeneralContentStates _typeState = GeneralContentStates.movie;

  GeneralContentStates get typeState => _typeState;

  void setState() {
    on<AppEvent>((event, emit) async {
      _typeState = event.typeState;
      emit(AppState(typeState: event.typeState));
    });
  }
}
