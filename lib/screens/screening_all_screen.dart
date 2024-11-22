import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_swap/bloc/screening_bloc.dart';
import 'package:practice_swap/bloc/screening_event.dart';
import 'package:practice_swap/bloc/screening_state.dart';
import 'package:practice_swap/widget/movie_screening_widget.dart';

class AllScreeningsPage extends StatefulWidget {
  const AllScreeningsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AllScreeningsPageState createState() => _AllScreeningsPageState();
}

class _AllScreeningsPageState extends State<AllScreeningsPage> {
  @override
  void initState() {
    super.initState();
    context.read<ScreeningBloc>().add(LoadScreeningsEvent());
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
        title: const Text('Screenings',
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<ScreeningBloc, ScreeningState>(
        builder: (context, state) {
          if (state is ScreeningLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ScreeningLoaded) {
            return ListView.builder(
              itemCount: state.screenings.length,
              itemBuilder: (context, index) {
                final screening = state.screenings[index];
                return MovieScreeningWidget(screening: screening);
              },
            );
          } else if (state is ScreeningError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
