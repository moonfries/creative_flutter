import 'package:equatable/equatable.dart';
import '../models/trending_models.dart';

abstract class TrendingState extends Equatable {
  @override
  List<Object> get props => [];
}

class TrendingInitial extends TrendingState {}

class TrendingLoading extends TrendingState {}

class TrendingLoaded extends TrendingState {
  final List<Trending> trendings;

  TrendingLoaded(this.trendings);

  @override
  List<Object> get props => [trendings];
}

class TrendingError extends TrendingState {
  final String message;

  TrendingError(this.message);

  @override
  List<Object> get props => [message];
}
