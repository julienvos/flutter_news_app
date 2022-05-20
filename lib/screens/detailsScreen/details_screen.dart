import 'package:flutter/material.dart';
import 'package:flutter_news/models/comment_item.dart';
import 'package:flutter_news/models/lifestyle_item.dart';

import 'components/item_picture_with_titles.dart';
import 'components/title_with_logo.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Icon(Icons.bookmark_add),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.download),
        )
      ]),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TitleWithLogo(
                  bannerTitle: "Jane Doe wins a game",
                  subtitle: 'By Jimmy and Loren',
                  logoUrl:
                      'https://images.unsplash.com/photo-1599305445671-ac291c95aaa9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYzNDY5OTY3MA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080'),
              Divider(
                color: Colors.grey[350],
              ),
              ItemPictureWithTitles(
                imageUrl:
                    'https://images.unsplash.com/photo-1620067925093-801122ac1408?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY1MDk4Mzc1OQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080',
                publisher: 'Bloomberg',
                imageTitle:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                category: "Health",
                timeAgo: '1m ago',
              ),
              Divider(),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eleifend donec pretium vulputate sapien nec sagittis aliquam malesuada bibendum. Eget gravida cum sociis natoque penatibus et magnis dis. Fringilla est ullamcorper eget nulla facilisi etiam dignissim diam quis. Eget egestas purus viverra accumsan. Quam adipiscing vitae proin sagittis nisl rhoncus. Ut eu sem integer vitae. Aliquet bibendum enim facilisis gravida neque convallis a. Integer quis auctor elit sed vulputate. Ut etiam sit amet nisl purus. Sed id semper risus in hendrerit gravida rutrum quisque. Scelerisque mauris pellentesque pulvinar pellentesque. Porttitor lacus luctus accumsan tortor posuere. Adipiscing elit duis tristique sollicitudin nibh sit amet. Amet porttitor eget dolor morbi non arcu risus. Mauris vitae ultricies leo integer malesuada. Cursus eget nunc scelerisque viverra. Lectus proin nibh nisl condimentum.Sed libero enim sed faucibus turpis in. In fermentum et sollicitudin ac orci. Vestibulum lectus mauris ultrices eros. Senectus et netus et malesuada fames ac turpis egestas. Faucibus in ornare quam viverra orci. Est ultricies integer quis auctor. Adipiscing vitae proin sagittis nisl rhoncus. Donec pretium vulputate sapien nec sagittis aliquam malesuada bibendum. Suspendisse interdum consectetur libero id faucibus nisl. Tincidunt vitae semper quis lectus nulla",
              ),
              HashtackChips(chipNames: [
                'sports',
                'trending',
                'today',
                'business',
                'finance'
              ]),
              FollowNewsItem(),
              Divider(),
              LifesStyleAdvise(),
              Divider(),
              CommentSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class CommentSection extends StatelessWidget {
  const CommentSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Comments',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: Text('+ To write',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            )
          ],
        ),

        //TO DO
        // replace Sizedbox with Expanded
        // adjust placing of the CircleAvatar
        SizedBox(
          height: 800,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: commentList.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(commentList[index].imageUrl)),
                title: Text(
                  commentList[index].userName,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(commentList[index].Date),
                    SizedBox(
                      height: 10,
                    ),
                    Text(commentList[index].commentText)
                  ],
                ),
                trailing: Icon(Icons.more_horiz),
              );
            },
          ),
        ),
      ],
    );
  }
}

class LifesStyleAdvise extends StatelessWidget {
  const LifesStyleAdvise({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TitleWithShowAll(title: "LifeStyle", showAllString: "Show All"),

        //To DO
        // change SizedBox into Expanded
        SizedBox(
          height: 275,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              width: 10,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: lifeStyleItems.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 125,
                height: 200,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        lifeStyleItems[index].imageUrl,
                        height: 125,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      lifeStyleItems[index].imageTitle,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey[700]),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class TitleWithShowAll extends StatelessWidget {
  final String title;
  final String showAllString;
  const TitleWithShowAll({
    Key? key,
    required this.title,
    required this.showAllString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            showAllString,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class FollowNewsItem extends StatelessWidget {
  const FollowNewsItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1584441405886-bc91be61e56a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxfDB8MXxhbGx8fHx8fHx8fA&ixlib=rb-1.2.1&q=80&w=1080&utm_source=unsplash_source&utm_medium=referral&utm_campaign=api-credit')),
      title: Text(
        'BBC news',
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'by Henk Fortuin',
      ),
      trailing: ElevatedButton(
        child: Text(
          '+ Follow',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () {},
      ),
    );
  }
}

class HashtackChips extends StatelessWidget {
  final List chipNames;
  const HashtackChips({
    Key? key,
    required this.chipNames,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 10,
        runAlignment: WrapAlignment.start,
        children: chipNames.map((e) => BuildChippie(name: e)).toList());
  }
}

class BuildChippie extends StatelessWidget {
  final String name;
  const BuildChippie({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('#$name',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 130, 128, 128))),
      backgroundColor: Color.fromARGB(223, 205, 205, 205),
    );
  }
}
