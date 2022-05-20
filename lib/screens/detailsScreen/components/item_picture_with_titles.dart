import 'package:flutter/material.dart';

class ItemPictureWithTitles extends StatelessWidget {
  final String imageUrl;
  final String publisher;
  final String imageTitle;
  final String category;
  final String timeAgo;

  const ItemPictureWithTitles({
    Key? key,
    required this.imageUrl,
    required this.publisher,
    required this.imageTitle,
    required this.category,
    required this.timeAgo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: 200,
          ),
        ),
        Text(
          publisher,
          style: Theme.of(context).textTheme.caption,
        ),
        Text(
          imageTitle,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold),
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
