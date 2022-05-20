import 'package:flutter/material.dart';
import 'package:flutter_news/managers/app_state_manager.dart';
import 'package:provider/provider.dart';

class TheNavBar extends StatelessWidget {
  const TheNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(builder: ((context, manager, child) {
      return BottomNavigationBar(
          onTap: manager.changeIndex,
          currentIndex: manager.selectedIndex,
          unselectedIconTheme: Theme.of(context).iconTheme,
          selectedIconTheme:
              Theme.of(context).iconTheme.copyWith(color: Colors.blue),
          showSelectedLabels: false,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: "explore"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: 'bookmark'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'profile')
          ]);
    }));
  }
}
