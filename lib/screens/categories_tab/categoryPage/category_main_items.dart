import 'package:flutter/material.dart';

import '../../home/components/main_news_item.dart';

class CategoryMainItems extends StatelessWidget {
  const CategoryMainItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: ((context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            width: 300,
            child: MainNewsItem(
                title: 'Hi there I am John Doe',
                imageUrl:
                    'https://images.unsplash.com/photo-1566501248434-6d513596c485?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY0MTkwNjcyNw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080',
                category: 'Fashion',
                timeAgo: '10m ago',
                publisher: 'Dior'),
          );
        }));
  }
}
