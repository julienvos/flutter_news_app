import 'package:flutter/material.dart';
import 'package:flutter_news/managers/app_state_manager.dart';
import 'package:flutter_news/the_nav_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'screens/AccountPage/account_page.dart';
import 'screens/BookmarkTab/bookMarkTab.dart';
import 'screens/categories_tab/categories_tab.dart';
import 'screens/home/homepage.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(builder: (context, manager, child) {
      return Scaffold(
          bottomNavigationBar: TheNavBar(),
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () =>
                      Provider.of<AppStateManager>(context, listen: false)
                          .logout(),
                  icon: Icon(Icons.logout)),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () => context.go('/search'),
                    icon: manager.selectedIndex == 3
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1631044061938-528e3df26ec9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY1MTc1NDMyOQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080'),
                          )
                        : Icon(Icons.search)),
              )
            ],
            centerTitle: true,
            title: Text(
              manager.appBarTitles[manager.selectedIndex],
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          body: IndexedStack(
            children: [
              HomePage(),
              CategoriesTab(),
              BookMarkTab(),
              AccountPage()
            ],
            index: manager.selectedIndex,
          ));
    });
  }
}
