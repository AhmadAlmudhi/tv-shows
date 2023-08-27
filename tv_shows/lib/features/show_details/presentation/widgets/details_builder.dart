import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_error.dart';
import '../../../shows/data/models/show.dart';
import '../../bloc/show_details_bloc.dart';
import 'details.dart';

class DetailsBuilder extends StatelessWidget {
  const DetailsBuilder({
    super.key,
    required this.show,
  });

  final Show show;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ShowDetailsBloc()..add(GetShowDetailsEvent(id: show.id)),
      child: BlocBuilder<ShowDetailsBloc, ShowDetailsState>(
        builder: (context, state) {
          if (state is ShowDetailsInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ShowDetailsLoadedState) {
            return Details(
              showDetails: state.showDetails,
              show: show,
            );
          } else if (state is ShowDetailsErrorState) {
            return CustomError(onButtonPressed: () {
              BlocProvider.of<ShowDetailsBloc>(context)
                  .add(GetShowDetailsEvent(id: show.id));
            });
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
