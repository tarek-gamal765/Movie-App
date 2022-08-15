part of 'app_bloc.dart';

class AppState extends Equatable {
  final GeneralContentStates typeState;

  const AppState({this.typeState = GeneralContentStates.movie});


  @override
  List<Object?> get props => [
        typeState
      ];
}
