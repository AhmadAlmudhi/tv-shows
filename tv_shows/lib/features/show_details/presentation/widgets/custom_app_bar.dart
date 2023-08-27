import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../favorites/bloc/favorites_bloc.dart';
import '../../../favorites/data/utils/favorites_cache_helper.dart';

import '../../../shows/data/models/show.dart';
import 'show_title.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
    required bool isAppBarExpanded,
    required this.show,
  }) : _isAppBarExpanded = isAppBarExpanded;

  final bool _isAppBarExpanded;
  final Show show;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [
        Visibility(
          visible: widget._isAppBarExpanded,
          child: IconButton(
            onPressed: () {
              setState(() {
                widget.show.isFavorite = !widget.show.isFavorite;

                if (widget.show.isFavorite) {
                  FavoritesCacheHelper().addToFavorites(widget.show);
                } else {
                  FavoritesCacheHelper().removeFromFavorites(widget.show);
                }
                BlocProvider.of<FavoritesBloc>(context)
                    .add(GetFavoriteShowsEvent());
              });
            },
            icon: widget.show.isFavorite
                ? const Icon(Icons.favorite, size: 35, color: Colors.red)
                : const Icon(Icons.favorite_border, size: 35),
          ),
        )
      ],
      pinned: true,
      automaticallyImplyLeading: widget._isAppBarExpanded,
      expandedHeight: MediaQuery.of(context).size.height / 2,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Visibility(
          visible: widget._isAppBarExpanded,
          child: ShowTitle(showName: widget.show.name),
        ),
        background: Hero(
          tag: widget.show.id,
          child: Image(
            errorBuilder: (context, error, stackTrace) {
              return Image.asset("assets/images/tv_image.jpeg");
            },
            image: NetworkImage(widget.show.image),
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height / 2,
          ),
        ),
      ),
    );
  }
}
