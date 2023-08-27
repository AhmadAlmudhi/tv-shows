import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../data/utils/favorites_cache_helper.dart';

import '../../shows/data/models/show.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesCacheHelper favoritesCacheHelper;
  FavoritesBloc({required this.favoritesCacheHelper})
      : super(FavoritesInitial()) {
    on<FavoritesEvent>(
      (event, emit) async {
        if (event is GetFavoriteShowsEvent) {
          final List<Show> shows =
              await favoritesCacheHelper.getFavoriteShows();
          emit(FavoritesLoadedState(shows: shows));
        } else {
          emit(FavoritesErrorState());
        }
      },
      transformer: droppable(),
    );
  }
}
