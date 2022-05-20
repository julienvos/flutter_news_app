import 'package:flutter/material.dart';

import '../categories_tab/categories_tab.dart';
import '../detailsScreen/details_screen.dart';
import '../home/components/brand_names.dart';
import '../home/components/brandnames_listwidget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SearchBox(),
              TitleWithShowAll(
                  title: "Top Channels", showAllString: "Show All"),
              SizedBox(
                height: 80,
                child: ListView.builder(
                    itemCount: brandNames.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BrandName(
                            imageUrl: brandNames[index].iconUrl,
                            brandName: brandNames[index].name),
                      );
                    })),
              ),
              TitleWithShowAll(
                  title: 'Popular Tags', showAllString: 'Show All'),

              // To DO ---- chipnames in different file
              HashtackChips(
                chipNames: ['trending', 'other', 'Stocks', 'Banking', 'World'],
              ),
              TitleWithShowAll(title: 'Hot News', showAllString: 'Show All'),
              SizedBox(
                height: 800,
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.8,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 160,
                              child: ClipRRect(
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1650339001464-749066de17fc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY1MTY3NTY5Nw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080',
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui.',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(color: Colors.grey[700]),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Politics',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(color: Colors.blue),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '5m ago',
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
