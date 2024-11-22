import 'package:equatable/equatable.dart';

abstract class ScreeningEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadScreeningsEvent extends ScreeningEvent {}
