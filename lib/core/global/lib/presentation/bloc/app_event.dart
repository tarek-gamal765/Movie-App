part of 'app_bloc.dart';

class AppEvent extends Equatable {
  final GeneralContentStates typeState;

  const AppEvent(this.typeState);

  @override
  List<Object?> get props => [typeState];
}
