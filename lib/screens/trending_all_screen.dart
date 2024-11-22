import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_swap/bloc/trending_bloc.dart';
import 'package:practice_swap/bloc/trending_event.dart';
import 'package:practice_swap/bloc/trending_state.dart';
import 'package:practice_swap/widget/movie_widget.dart';

class TrendingAllScreeningsPage extends StatefulWidget {
  const TrendingAllScreeningsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TrendingAllScreeningsPageState createState() =>
      _TrendingAllScreeningsPageState();
}

class _TrendingAllScreeningsPageState extends State<TrendingAllScreeningsPage> {
  @override
  void initState() {
    super.initState();
    context.read<TrendingBloc>().add(LoadTrendingsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Trending Screenings',
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<TrendingBloc, TrendingState>(
        builder: (context, state) {
          if (state is TrendingLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TrendingLoaded) {
            return ListView.builder(
              itemCount: state.trendings.length,
              itemBuilder: (context, index) {
                final screening = state.trendings[index];
                return MovieWidget(trending: screening);
              },
            );
          } else if (state is TrendingError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
