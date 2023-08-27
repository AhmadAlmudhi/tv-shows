import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_error.dart';
import '../../../settings/bloc/localization/utils/app_localization.dart';
import '../../../../core/widgets/shows_builder.dart';
import '../../../shows/data/models/show.dart';
import '../../bloc/favorites_bloc.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: TabBar(
          labelPadding: const EdgeInsets.all(0),
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          tabs: [
            Tab(text: "never".tr(context)),
            Tab(text: "still".tr(context)),
            Tab(text: "finished".tr(context)),
          ],
        ),
        body: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FavoritesLoadedState) {
              List<Show> neverWatchedShows = [];
              List<Show> stillWatchingShows = [];
              List<Show> finishedWatchingShows = [];

              for (var show in state.shows) {
                if (show.watchingStatus == "never") {
                  neverWatchedShows.add(show);
                } else if (show.watchingStatus == "still") {
                  stillWatchingShows.add(show);
                } else if (show.watchingStatus == "finished") {
                  finishedWatchingShows.add(show);
                }
              }
              return TabBarView(
                children: [
                  ShowsBuilder(shows: neverWatchedShows),
                  ShowsBuilder(shows: stillWatchingShows),
                  ShowsBuilder(shows: finishedWatchingShows),
                ],
              );
            } else if (state is FavoritesErrorState) {
              return CustomError(onButtonPressed: () {});
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
