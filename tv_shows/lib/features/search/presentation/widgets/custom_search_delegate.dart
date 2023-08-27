import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/shows_builder.dart';
import '../../bloc/search_bloc.dart';

class ShowsSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => "";
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Visibility(
        visible: query != "",
        child: IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
        ),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const BackButtonIcon(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query != "") {
      BlocProvider.of<SearchBloc>(context).add(GetResulstEvent(name: query));
      return BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state.status == SearchStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == SearchStatus.success) {
            return ShowsBuilder(
              shows: state.shows,
              getMoreResults: () {
                BlocProvider.of<SearchBloc>(context)
                    .add(GetMoreResultsEvent(name: query));
              },
            );
          } else if (state.status == SearchStatus.error) {
            return const Center(child: CustomText(data: "not_found"));
          } else {
            return Container();
          }
        },
      );
    } else {
      return Container();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}
