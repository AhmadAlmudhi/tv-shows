import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../favorites/presentation/screens/favorites_screen.dart';
import '../../../search/presentation/widgets/custom_search_delegate.dart';
import '../../../settings/presentation/screens/settings_screen.dart';

import '../../../shows/presentation/screens/shows_screen.dart';
import '../widgets/custom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  String title = "shows";

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          title = "favorites";
          break;
        case 1:
          title = "shows";
          break;
        case 2:
          title = "settings";
          break;
      }
    });
  }

  final List<Widget> _widgetOptions = <Widget>[
    const FavoritesScreen(),
    const ShowsScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(data: title),
        centerTitle: true,
        actions: [
          Visibility(
            visible: title == "shows",
            child: IconButton(
              onPressed: () {
                showSearch(context: context, delegate: ShowsSearchDelegate());
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
