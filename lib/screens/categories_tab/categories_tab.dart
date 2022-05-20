import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/subject_categories.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchBox(),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0.5,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: ListTile(
                      onTap: () => context.go('/categoryID'),
                      title: Text(
                        subjects[index].title,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: subjects[index].checked
                              ? Icon(
                                  Icons.check_circle,
                                  color: Colors.blue,
                                )
                              : Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.blue,
                                ))),
                );
              }),
        )
      ],
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
          fillColor: Colors.white,
          filled: true,
          hintText: "Search...",
          prefixIcon: const Icon(
            Icons.search,
            size: 25,
          ),
          suffixIcon:
              IconButton(icon: const Icon(Icons.clear), onPressed: () {})),
    );
  }
}
