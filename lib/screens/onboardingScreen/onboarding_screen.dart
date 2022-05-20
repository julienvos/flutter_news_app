import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Features'),
          Text(
              'The best news channel app, everything in one place. Trusted sources and personalized news'),
          SizedBox(
            height: 50,
          ),
          ListTile(
            subtitle: Text(
                'Awesome photography and typography provide a beautiful experience'),
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    'https://images.unsplash.com/photo-1576872381149-7847515ce5d8?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY0MjUxMzcxNw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080')),
          ),
          ListTile(
            subtitle: Text(
                'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur'),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                  'https://images.unsplash.com/photo-1652256127921-a59d0c371eee?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY1MjI3ODM4OQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080'),
            ),
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                  'https://images.unsplash.com/photo-1583776216237-7cfcd9941a10?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY1MjI3ODUxOQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080'),
            ),
            subtitle: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Get Started'))
        ],
      ),
    );
  }
}
