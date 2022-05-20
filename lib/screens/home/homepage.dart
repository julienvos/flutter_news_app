import 'package:flutter/material.dart';
import 'package:flutter_news/screens/home/components/brand_names.dart';
import 'package:flutter_news/screens/home/components/news_items.dart';
import 'package:go_router/go_router.dart';

import 'components/brandnames_listwidget.dart';
import 'components/category_list.dart';
import 'components/email_subscription.dart';
import 'components/main_news_item.dart';
import 'components/news_item_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CategoryRow(),
          GestureDetector(
            onTap: () => context.go('/details/someID'),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MainNewsItem(
                  imageUrl:
                      'https://images.unsplash.com/photo-1552083375-1447ce886485?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxfDB8MXxhbGx8fHx8fHx8fA&ixlib=rb-1.2.1&q=80&w=1080&utm_source=unsplash_source&utm_medium=referral&utm_campaign=api-credit',
                  category: 'Health',
                  publisher: 'Bloomberg',
                  timeAgo: '5m ago',
                  title:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
            ),
          ),
          Divider(),
          BrandNamesList(brandNameList: brandNames),
          SizedBox(
            height: 5,
          ),
          NewsItemList(
            newsItemList: newsItems,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: EmailSubscription(),
          ),
        ],
      ),
    );
  }
}
