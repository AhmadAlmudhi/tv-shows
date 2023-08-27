import 'package:flutter/material.dart';
import '../../../settings/bloc/localization/utils/app_localization.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required int selectedIndex,
    required this.onTap,
  }) : _selectedIndex = selectedIndex;

  final int _selectedIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 30,
      selectedFontSize: 20,
      unselectedFontSize: 15,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          label: "favorites".tr(context),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.tv),
          label: "shows".tr(context),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: "settings".tr(context),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: onTap,
    );
  }
}
