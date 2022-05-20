import 'package:flutter/material.dart';

import 'components/account_details.dart';
import 'components/subscription.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choose Your plan',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                Icon(Icons.info)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SubscriptionButtons(),
            Divider(
              thickness: 7,
            ),
            AccountDetails(
              subject: 'Full Name',
              info: 'Marcus Doe',
            ),
            AccountDetails(subject: "Email", info: "marcusdoe@gmail.com"),
            AccountDetails(subject: "Country", info: "Sweden >"),
            AccountDetails(subject: "City", info: "Stockholm >"),
            Divider(
              thickness: 7,
            ),
            AccountDetails(subject: 'Favorite Channels', info: '17 >'),
            AccountDetails(subject: "Bookmarks", info: '386'),
            Divider(
              thickness: 7,
            ),
            AccountDetails(subject: 'Newsletters', info: '>'),
            AccountDetails(subject: "Settings", info: '>'),
            Divider(
              thickness: 7,
            ),
            AccountDetails(subject: 'Logout', info: '>')
          ],
        ),
      ),
    );
  }
}
