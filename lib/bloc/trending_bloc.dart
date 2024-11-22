// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:practice_swap/bloc/trending_event.dart';
import 'package:practice_swap/bloc/trending_state.dart';
import 'package:practice_swap/service_api/api.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final Api api;

  TrendingBloc(this.api) : super(TrendingInitial()) {
    on<LoadTrendingsEvent>((event, emit) async {
      emit(TrendingLoading());
      try {
        final trendings = await api.fetchTrendingScreenings();
        emit(TrendingLoaded(trendings));
      } catch (e) {
        emit(TrendingError(e.toString()));
      }
    });
  }
}
