import 'package:equatable/equatable.dart';
import '../models/screenings_models.dart';

abstract class ScreeningState extends Equatable {
  @override
  List<Object> get props => [];
}

class ScreeningInitial extends ScreeningState {}

class ScreeningLoading extends ScreeningState {}

class ScreeningLoaded extends ScreeningState {
  final List<Screenings> screenings;

  ScreeningLoaded(this.screenings);

  @override
  List<Object> get props => [screenings];
}

class ScreeningError extends ScreeningState {
  final String message;

  ScreeningError(this.message);

  @override
  List<Object> get props => [message];
}
