import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../data/api/show_details_api.dart';
import '../data/models/show_details.dart';

part 'show_details_event.dart';
part 'show_details_state.dart';

class ShowDetailsBloc extends Bloc<GetShowDetailsEvent, ShowDetailsState> {
  ShowDetailsBloc() : super(ShowDetailsInitial()) {
    on<GetShowDetailsEvent>(
      (event, emit) async {
        try {
          final ShowDetails showDetails =
              await ShowDetailsApi().getShowDetails(event.id);
          emit(ShowDetailsLoadedState(showDetails: showDetails));
        } catch (e) {
          emit(ShowDetailsErrorState());
        }
      },
    );
  }
}
