import 'package:flutter/material.dart';

class LifeStyleModel {
  final String imageUrl;
  final String imageTitle;

  LifeStyleModel({required this.imageUrl, required this.imageTitle});
}

List<LifeStyleModel> lifeStyleItems = [
  LifeStyleModel(
      imageUrl:
          'https://images.unsplash.com/photo-1520179432903-03d08e6ef07a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxfDB8MXxhbGx8fHx8fHx8fA&ixlib=rb-1.2.1&q=80&w=1080&utm_source=unsplash_source&utm_medium=referral&utm_campaign=api-credit',
      imageTitle:
          'Happy eating here, Nullam vehicula ipsum a arcu cursus vitae congue mauris rhoncus.'),
  LifeStyleModel(
      imageUrl:
          'https://images.unsplash.com/photo-1526566762798-8fac9c07aa98?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxfDB8MXxhbGx8fHx8fHx8fA&ixlib=rb-1.2.1&q=80&w=1080&utm_source=unsplash_source&utm_medium=referral&utm_campaign=api-credit',
      imageTitle:
          'You got that lifestyle, Est velit egestas dui id ornare arcu odio'),
  LifeStyleModel(
      imageUrl:
          'https://images.unsplash.com/photo-1488646953014-85cb44e25828?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxfDB8MXxhbGx8fHx8fHx8fA&ixlib=rb-1.2.1&q=80&w=1080&utm_source=unsplash_source&utm_medium=referral&utm_campaign=api-credit',
      imageTitle:
          'Traveling you know, Amet commodo nulla facilisi nullam vehicula ipsum')
];
