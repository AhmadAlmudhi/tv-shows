part of 'show_details_bloc.dart';

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
