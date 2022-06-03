import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/data/main_news_item_dao.dart';
import 'package:flutter_news/models/main_news_model/main_news_model.dart';
import 'package:flutter_news/screens/home/components/brand_names.dart';
import 'package:flutter_news/screens/home/components/news_items.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
    final mainNewsDao = Provider.of<MainNewsDAO>(context, listen: false);
    final lastItem = mainNewsDao.getStream();
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
              child: StreamBuilder<QuerySnapshot>(
                stream: mainNewsDao.getStream(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: LinearProgressIndicator());
                  }

                  final newsItem =
                      snapshot.data?.docs.first; //most recent first
                  final convertedNewsItem =
                      MainNewsModel.fromSnapshot(newsItem);
                  return MainNewsItem(
                      imageUrl: convertedNewsItem.imageUrl as String,
                      category: convertedNewsItem.category as String,
                      publisher: convertedNewsItem.publisher as String,
                      timeAgo: convertedNewsItem.date.toString(),
                      title: convertedNewsItem.title as String);
                },
              ),
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
