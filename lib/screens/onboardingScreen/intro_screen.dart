import 'package:flutter/material.dart';
import 'package:flutter_news/managers/app_state_manager.dart';
import 'package:go_router/go_router.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({Key? key}) : super(key: key);

  @override
  State<BoardingPage> createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  final _introKey = GlobalKey<IntroductionScreenState>();
  bool _skipBoarding = false;
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: _introKey,
      pages: [
        PageViewModel(
            decoration: PageDecoration(),
            bodyWidget: Column(
              children: [
                Text(
                  'Features',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                    'The best news channel app, everything in one place. Trusted sources and personalized news'),
                SizedBox(
                  height: 50,
                ),
                IntroItem(
                    text:
                        'Awesome photography and typography provide a beautiful experience',
                    imageUrl:
                        'https://images.unsplash.com/photo-1652256127921-a59d0c371eee?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY1MjI3ODM4OQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080'),
                IntroItem(
                    text:
                        'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
                    imageUrl:
                        'https://images.unsplash.com/photo-1652256127921-a59d0c371eee?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY1MjI3ODM4OQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080'),
                IntroItem(
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    imageUrl:
                        'https://images.unsplash.com/photo-1583776216237-7cfcd9941a10?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY1MjI3ODUxOQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080')
              ],
            ),
            title: ' '),
        PageViewModel(
            footer: Checkbox(
                value: _skipBoarding,
                onChanged: (value) {
                  setState(() {
                    _skipBoarding = value!; // null check
                  });
                }),
            decoration: PageDecoration(),
            bodyWidget: Text('Something else'),
            title: ' ')
      ],
      onDone: () async {
        Provider.of<AppStateManager>(context, listen: false).onBoarded();
        //or use context.read<AppStateManager>().isBoarded(); // inside callbacks
        context.go('/login');
        if (_skipBoarding) {
          SharedPreferences sharedprefs = await SharedPreferences.getInstance();
          sharedprefs.setBool('boarded', true);
        }
      },
      onSkip: () {
        Provider.of<AppStateManager>(context, listen: false).onBoarded();
        context.go('/login');
      },
      showDoneButton: true,
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Text('Next'),
      skip: Text(
        'Skip',
      ),
      showSkipButton: true,
      curve: Curves.easeInBack,
    );
  }
}

class IntroItem extends StatelessWidget {
  final String text;
  final String imageUrl;
  const IntroItem({
    Key? key,
    required this.text,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        subtitle: Text(text),
        leading: Container(
          height: 100,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ));
  }
}
