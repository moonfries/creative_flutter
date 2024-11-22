import 'package:equatable/equatable.dart';

abstract class TrendingEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadTrendingsEvent extends TrendingEvent {}
