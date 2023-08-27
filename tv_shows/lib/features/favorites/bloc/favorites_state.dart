part of 'favorites_bloc.dart';

sealed class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoadedState extends FavoritesState {
  final List<Show> shows;

  const FavoritesLoadedState({required this.shows});

  @override
  List<Object> get props => [shows];
}

final class FavoritesErrorState extends FavoritesState {}
/**
 sealed class ShowDetailsState extends Equatable {
  const ShowDetailsState();

  @override
  List<Object> get props => [];
}

final class ShowDetailsInitial extends ShowDetailsState {}

final class ShowDetailsLoadedState extends ShowDetailsState {
  final ShowDetails showDetails;

  const ShowDetailsLoadedState({required this.showDetails});

  @override
  List<Object> get props => [showDetails];
}

final class ShowDetailsErrorState extends ShowDetailsState {}
 */
