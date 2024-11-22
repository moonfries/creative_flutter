import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_swap/bloc/screening_bloc.dart';
import 'package:practice_swap/bloc/screening_state.dart';
import 'package:practice_swap/bloc/trending_bloc.dart';
import 'package:practice_swap/bloc/trending_state.dart';
import 'package:practice_swap/screens/screening_all_screen.dart';
import 'package:practice_swap/screens/trending_all_screen.dart';
import 'package:practice_swap/widget/movie_screening_widget.dart';
import 'package:practice_swap/widget/movie_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<TrendingBloc, TrendingState>(
              builder: (context, state) {
                if (state is TrendingLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TrendingLoaded) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 16, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Flexible(
                                child: Text(
                                  'Trending Community Screening',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TrendingAllScreeningsPage()),
                                  );
                                },
                                child: const Text(
                                  'See All',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 230, 34, 80),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            final screening = state.trendings[index];
                            return MovieWidget(trending: screening);
                          },
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                        ),
                      ],
                    ),
                  );
                } else if (state is TrendingError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return const Center(child: Text('No data available.'));
                }
              },
            ),
            BlocBuilder<ScreeningBloc, ScreeningState>(
              builder: (context, state) {
                if (state is ScreeningLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ScreeningLoaded) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Flexible(
                                child: Text(
                                  'All Screenings',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AllScreeningsPage()),
                                  );
                                },
                                child: const Text(
                                  'See All',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 230, 34, 80),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            final screening = state.screenings[index];
                            return MovieScreeningWidget(screening: screening);
                          },
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                        ),
                      ],
                    ),
                  );
                } else if (state is ScreeningError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return const Center(child: Text('No data available.'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
