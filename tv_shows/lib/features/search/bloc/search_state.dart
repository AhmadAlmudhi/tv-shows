part of 'search_bloc.dart';

enum SearchStatus { loading, success, error }

class SearchState extends Equatable {
  final SearchStatus status;
  final List<Show> shows;

  const SearchState({
    this.shows = const [],
    this.status = SearchStatus.loading,
  });

  SearchState copyWith({SearchStatus? status, List<Show>? shows}) {
    return SearchState(
      shows: shows ?? this.shows,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [shows, status];
}
