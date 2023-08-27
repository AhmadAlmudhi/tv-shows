part of 'show_details_bloc.dart';

class GetShowDetailsEvent extends Equatable {
  final int id;

  const GetShowDetailsEvent({required this.id});

  @override
  List<Object> get props => [id];
}
