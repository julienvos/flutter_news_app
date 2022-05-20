import 'package:flutter/material.dart';

import '../../home/components/news_item_list.dart';
import '../../home/components/news_items.dart';

class CategoryNewsItems extends StatelessWidget {
  const CategoryNewsItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: newsItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: NewsItem(
            imageUrl: newsItems[index].imageUrl,
            newsTitle: newsItems[index].title,
            category: newsItems[index].category,
            timeAgo: '1m ago',
            newsSource: newsItems[index].newsSource,
          ),
        );
      },
    );
  }
}
