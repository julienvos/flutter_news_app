import 'package:flutter/material.dart';

import '../../detailsScreen/details_screen.dart';
import 'category_main_items.dart';
import 'category_news_items.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Politics',
                style: Theme.of(context).textTheme.headline6,
              ),
              Divider(),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: BuildChippie(name: 'today'),
                    );
                  }),
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Divider(),
              SizedBox(
                height: 300,
                child: CategoryMainItems(),
              ),
              //TO DO: Set the divider closer to the news item
              Divider(),
              CategoryNewsItems()
            ],
          ),
        ),
      ),
    );
  }
}
