import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../data/api/shows_api.dart';

import '../data/models/show.dart';

part 'shows_event.dart';
part 'shows_state.dart';

class ShowsBloc extends Bloc<ShowsEvent, ShowsState> {
  final ShowsApi showsApi;
  ShowsBloc({required this.showsApi}) : super(const ShowsState()) {
    on<ShowsEvent>(
      (event, emit) async {
        if (event is GetAllShowsEvent) {
          try {
            if (state.status == ShowsStatus.loading) {
              final List<Show> shows = await showsApi.getAllShows(1);
              return emit(state.copyWith(
                status: ShowsStatus.success,
                shows: shows,
              ));
            } else {
              int pageNumber = (state.shows.length + 20) ~/ 20;
              final List<Show> shows = await showsApi.getAllShows(pageNumber);
              return emit(state.copyWith(
                  status: ShowsStatus.success,
                  shows: List.of(state.shows)..addAll(shows)));
            }
          } catch (e) {
            emit(state.copyWith(status: ShowsStatus.error));
          }
        }
      },
      transformer: droppable(),
    );
  }
}
