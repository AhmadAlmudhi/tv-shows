import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_error.dart';
import '../../../../core/widgets/shows_builder.dart';
import '../../bloc/shows_bloc.dart';

class ShowsScreen extends StatefulWidget {
  const ShowsScreen({super.key});

  @override
  State<ShowsScreen> createState() => _ShowsScreenState();
}

class _ShowsScreenState extends State<ShowsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowsBloc, ShowsState>(
      builder: (context, state) {
        switch (state.status) {
          case ShowsStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ShowsStatus.success:
            return ShowsBuilder(
              shows: state.shows,
              getMoreResults: () {
                BlocProvider.of<ShowsBloc>(context).add(GetAllShowsEvent());
              },
            );
          case ShowsStatus.error:
            return CustomError(
              onButtonPressed: () {
                BlocProvider.of<ShowsBloc>(context).add(GetAllShowsEvent());
              },
            );
        }
      },
    );
  }
}
