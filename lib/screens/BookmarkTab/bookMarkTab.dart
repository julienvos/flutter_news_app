import 'package:flutter/material.dart';

import '../home/components/brand_names.dart';
import '../home/components/brandnames_listwidget.dart';
import '../home/components/main_news_item.dart';
import '../home/components/news_item_list.dart';

class BookMarkTab extends StatelessWidget {
  const BookMarkTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BrandNamesList(
              brandNameList: brandNames,
            ),
            SizedBox(
              height: 10,
            ),
            NewsItem(
                imageUrl:
                    'https://images.unsplash.com/photo-1651661268931-607e69852087?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY1MTc0NjM0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080',
                newsSource: 'ANP',
                newsTitle: 'Girl with sweater',
                category: 'Fashion',
                timeAgo: '15m ago'),
            Divider(),
            NewsItem(
                newsSource: 'New York Times',
                newsTitle:
                    'Egestas maecenas pharetra convallis posuere morbi leo. Sapien nec sagittis aliquam malesuada bibendum.',
                category: 'Traveling',
                timeAgo: '25m ago'),
            Divider(),
            MainNewsItem(
                title: 'Some title over here, to say something',
                imageUrl:
                    'https://images.unsplash.com/photo-1651692187386-ded9cb3b914b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY1MTc0ODgzNw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080',
                category: 'Cars',
                timeAgo: '20m ago',
                publisher: 'ANP'),
            Divider(),
            NewsItem(
                imageUrl:
                    'https://images.unsplash.com/photo-1594498653385-d5172c532c00?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8c3ViamVjdHx8fHx8fDE2MzQ1OTQxMDk&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080',
                newsSource: 'New York Times',
                newsTitle:
                    'Bibendum est ultricies integer quis auctor elit sed',
                category: 'News',
                timeAgo: '20m ago'),
            TextButton(
              onPressed: () {},
              child: Text('Load more'),
            )
          ],
        ),
      ),
    );
  }
}
