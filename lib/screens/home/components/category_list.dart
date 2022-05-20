import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'news_categories.dart';

class CategoryRow extends StatefulWidget {
  const CategoryRow({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryRow> createState() => _CategoryRowState();
}

class _CategoryRowState extends State<CategoryRow> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          thickness: 1,
          color: Colors.grey[350],
        ),
        rowWithCategories(),
        Divider(
          thickness: 1,
          color: Colors.grey[350],
        )
      ],
    );
  }

  SizedBox rowWithCategories() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Text(categories[index],
                      style: Theme.of(context).textTheme.button?.copyWith(
                          color: selectedIndex == index
                              ? Colors.blue
                              : kTextLightColor))),
            );
          }),
    );
  }
}
