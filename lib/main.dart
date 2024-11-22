import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_swap/bloc/screening_bloc.dart';
import 'package:practice_swap/bloc/screening_event.dart';
import 'package:practice_swap/screens/home_screen.dart';
import 'package:practice_swap/service_api/api.dart';
import './bloc/trending_bloc.dart';
import './bloc/trending_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                TrendingBloc(Api())..add(LoadTrendingsEvent())),
        BlocProvider(
            create: (context) =>
                ScreeningBloc(Api())..add(LoadScreeningsEvent())),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
