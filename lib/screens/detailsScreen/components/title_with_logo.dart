import 'package:flutter/material.dart';

class TitleWithLogo extends StatelessWidget {
  final String bannerTitle;
  final String subtitle;
  final String logoUrl;
  const TitleWithLogo({
    Key? key,
    required this.bannerTitle,
    required this.subtitle,
    required this.logoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bannerTitle,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CircleAvatar(backgroundImage: NetworkImage(logoUrl)),
        ),
      ],
    );
  }
}
