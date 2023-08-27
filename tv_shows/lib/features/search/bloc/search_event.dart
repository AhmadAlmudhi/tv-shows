// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetResulstEvent extends SearchEvent {
  final String name;

  const GetResulstEvent({
    required this.name,
  });

  @override
  List<Object> get props => [name];
}

class GetMoreResultsEvent extends SearchEvent {
  final String name;

  const GetMoreResultsEvent({
    required this.name,
  });

  @override
  List<Object> get props => [name];
}
