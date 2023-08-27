import 'package:flutter/material.dart';
import '../widgets/show_title.dart';
import '../../../shows/data/models/show.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/details_builder.dart';

class ShowDetailsScreen extends StatefulWidget {
  const ShowDetailsScreen({super.key, required this.show});

  final Show show;

  @override
  State<ShowDetailsScreen> createState() => _ShowDetailsScreenState();
}

class _ShowDetailsScreenState extends State<ShowDetailsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {
      setState(() {});
    });
    super.dispose();
  }

  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset >
            (MediaQuery.of(context).size.height / 2 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          CustomAppBar(
            isAppBarExpanded: _isAppBarExpanded,
            show: widget.show,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) {
                return Column(
                  children: [
                    Visibility(
                      visible: !_isAppBarExpanded,
                      child: ShowTitle(showName: widget.show.name),
                    ),
                    DetailsBuilder(show: widget.show),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
