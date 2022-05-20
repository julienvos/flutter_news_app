import 'package:flutter/material.dart';

import 'news_items.dart';

class NewsItemList extends StatelessWidget {
  final List<NewsModel> newsItemList;

  const NewsItemList({
    Key? key,
    required this.newsItemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: newsItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: NewsItem(
            imageUrl: newsItemList[index].imageUrl,
            newsTitle: newsItemList[index].title,
            category: newsItemList[index].category,
            timeAgo: '1m ago',
            newsSource: newsItemList[index].newsSource,
          ),
        );
      },
    );
  }
}

class NewsItem extends StatelessWidget {
  String? imageUrl;
  final String newsSource;
  final String newsTitle;
  final String category;
  final String timeAgo;

  NewsItem({
    Key? key,
    this.imageUrl,
    required this.newsSource,
    required this.newsTitle,
    required this.category,
    required this.timeAgo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (imageUrl != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl!,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsSource,
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  newsTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
                Row(
                  // copied from the main news article
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          category,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Color.fromARGB(255, 64, 142, 207)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          timeAgo,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const Icon(Icons.more_horiz)
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
