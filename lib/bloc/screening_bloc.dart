// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:practice_swap/bloc/screening_event.dart';
import 'package:practice_swap/bloc/screening_state.dart';
import 'package:practice_swap/service_api/api.dart';

class ScreeningBloc extends Bloc<ScreeningEvent, ScreeningState> {
  final Api api;

  ScreeningBloc(this.api) : super(ScreeningInitial()) {
    on<LoadScreeningsEvent>((event, emit) async {
      emit(ScreeningLoading());
      try {
        final screenings = await api.fetchScreenings();
        emit(ScreeningLoaded(screenings));
      } catch (e) {
        emit(ScreeningError(e.toString()));
      }
    });
  }
}
