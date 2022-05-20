import 'package:flutter/material.dart';
import 'package:flutter_news/screens/home/components/news_items.dart';

import '../detailsScreen/components/item_picture_with_titles.dart';
import '../detailsScreen/components/title_with_logo.dart';
import '../home/components/category_list.dart';
import '../home/components/news_item_list.dart';

class NewsSitePage extends StatelessWidget {
  const NewsSitePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.bookmark),
                const SizedBox(
                  width: 5,
                ),
                const Icon(Icons.search)
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            TitleWithLogo(
                bannerTitle: 'Fox News',
                subtitle: 'Broadcast Media',
                logoUrl:
                    'https://images.unsplash.com/photo-1433838552652-f9a46b332c40?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxhbGx8fHx8fHx8fHwxNjIzMjY2NDI2&ixlib=rb-1.2.1&q=80&w=1080&utm_source=unsplash_source&utm_medium=referral&utm_campaign=api-credit'),
            CategoryRow(),
            SizedBox(
              height: 20,
            ),
            ItemPictureWithTitles(
                imageUrl:
                    'https://images.unsplash.com/photo-1501785888041-af3ef285b470?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxfDB8MXxhbGx8fHx8fHx8fA&ixlib=rb-1.2.1&q=80&w=1080&utm_source=unsplash_source&utm_medium=referral&utm_campaign=api-credit',
                publisher: 'Reuters',
                imageTitle:
                    'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
                category: 'Nature',
                timeAgo: '10m ago'),
            Divider(
              color: Colors.grey[400],
            ),
            NewsItemList(
              newsItemList: newsItems,
            )
          ]),
        ),
      ),
    );
  }
}
