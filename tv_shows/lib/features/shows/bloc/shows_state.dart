part of 'shows_bloc.dart';

enum ShowsStatus { loading, success, error }

class ShowsState extends Equatable {
  final ShowsStatus status;
  final List<Show> shows;

  const ShowsState({
    this.status = ShowsStatus.loading,
    this.shows = const [],
  });

  ShowsState copyWith({ShowsStatus? status, List<Show>? shows}) {
    return ShowsState(
      status: status ?? this.status,
      shows: shows ?? this.shows,
    );
  }

  @override
  List<Object> get props => [status, shows];
}
