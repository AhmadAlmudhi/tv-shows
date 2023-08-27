import 'package:flutter/material.dart';
import '../../features/favorites/data/utils/favorites_cache_helper.dart';

import '../../features/show_details/presentation/screens/show_details_screen.dart';
import '../../features/shows/data/models/show.dart';

class ShowsBuilder extends StatefulWidget {
  const ShowsBuilder({
    super.key,
    required this.shows,
    this.getMoreResults,
  });

  final List<Show> shows;
  final Function()? getMoreResults;

  @override
  State<ShowsBuilder> createState() => _ShowsBuilderState();
}

class _ShowsBuilderState extends State<ShowsBuilder> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= (maxScroll * 0.75)) {
      widget.getMoreResults?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisExtent: MediaQuery.of(context).size.height / 3,
        maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
      ),
      itemCount: widget.shows.length,
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: InkWell(
            onTap: () async {
              final updatedShow = await FavoritesCacheHelper()
                  .addedToFavoritesCheck(widget.shows[index]);

              if (context.mounted) {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => ShowDetailsScreen(
                      show: updatedShow,
                    ),
                  ),
                );
              }
            },
            child: Card(
              child: Stack(
                children: [
                  Hero(
                    tag: widget.shows[index].id,
                    child: Image(
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset("assets/images/tv_image.jpeg");
                      },
                      image: NetworkImage(widget.shows[index].image),
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 50,
                      color: const Color.fromARGB(175, 0, 0, 0),
                      child: Center(
                        child: Text(
                          widget.shows[index].name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
