part of 'shows_bloc.dart';

sealed class ShowsEvent extends Equatable {
  const ShowsEvent();

  @override
  List<Object> get props => [];
}

class GetAllShowsEvent extends ShowsEvent {}
