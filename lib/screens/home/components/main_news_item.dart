import 'package:flutter/material.dart';

class MainNewsItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String category;
  final String timeAgo;
  final String publisher;

  const MainNewsItem({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.category,
    required this.timeAgo,
    required this.publisher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // to use the flexible widget
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
        ),
        Text(
          publisher,
          style: Theme.of(context).textTheme.caption,
        ),
        Flexible(
          flex: 1,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  category,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Color.fromARGB(255, 64, 142, 207)),
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
    );
  }
}
