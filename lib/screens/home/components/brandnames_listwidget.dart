import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'brand_names.dart';

class BrandNamesList extends StatelessWidget {
  final List<BrandModel> brandNameList;

  const BrandNamesList({
    Key? key,
    required this.brandNameList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        itemCount: brandNames.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () => context.go('/source/someSourceID'),
              child: BrandName(
                imageUrl: brandNameList[index].iconUrl,
                brandName: brandNameList[index].name,
              ),
            ),
          );
        }),
      ),
    );
  }
}

class BrandName extends StatelessWidget {
  final String imageUrl;
  final String brandName;

  const BrandName({
    Key? key,
    required this.imageUrl,
    required this.brandName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.white,
          elevation: 5,
          shape: CircleBorder(),
          child:
              CircleAvatar(radius: 18, backgroundImage: NetworkImage(imageUrl)),
        ),
        Text(
          brandName,
          style: Theme.of(context).textTheme.bodySmall,
        ),

        //Add Divider here?
      ],
    );
  }
}
