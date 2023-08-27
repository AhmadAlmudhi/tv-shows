import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../data/api/search_api.dart';

import '../../shows/data/models/show.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchApi searchApi;
  SearchBloc({required this.searchApi}) : super(const SearchState()) {
    on<SearchEvent>((event, emit) async {
      if (event is GetResulstEvent) {
        final List<Show> shows = await searchApi.search(event.name, 1);
        if (shows.isNotEmpty) {
          emit(state.copyWith(shows: shows, status: SearchStatus.success));
        } else {
          emit(state.copyWith(status: SearchStatus.error));
        }
      } else if (event is GetMoreResultsEvent) {
        if (state.shows.length % 20 == 0) {
          int pageNumber = (state.shows.length + 20) ~/ 20;
          final List<Show> shows =
              await searchApi.search(event.name, pageNumber);
          if (shows.isNotEmpty) {
            emit(state.copyWith(
                status: SearchStatus.success,
                shows: List.of(state.shows)..addAll(shows)));
          } else {
            emit(state.copyWith(status: SearchStatus.error));
          }
        }
      }
    }, transformer: droppable());
  }
}
