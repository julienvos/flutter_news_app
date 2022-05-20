import 'package:flutter/material.dart';

enum SubscriptionChoice { month, year }

class SubscriptionButtons extends StatefulWidget {
  const SubscriptionButtons({
    Key? key,
  }) : super(key: key);

  @override
  State<SubscriptionButtons> createState() => _SubscriptionButtonsState();
}

class _SubscriptionButtonsState extends State<SubscriptionButtons> {
  SubscriptionChoice _choice = SubscriptionChoice.month;
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => setState(() {
                _choice = SubscriptionChoice.month;
              }),
              child: SubscriptionButton(
                price: 9.99,
                timeTerm: 'Month',
                isEnabled: _choice == SubscriptionChoice.month,
              ),
            ),
            GestureDetector(
                onTap: () => setState(() {
                      _choice = SubscriptionChoice.year;
                    }),
                child: SubscriptionButton(
                  timeTerm: 'Year',
                  price: 4.99,
                  isEnabled: _choice == SubscriptionChoice.year,
                ))
          ],
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('Get Premium!'),
        )
      ],
    );
  }
}

class SubscriptionButton extends StatelessWidget {
  final String timeTerm;
  final double price;
  final bool isEnabled;
  const SubscriptionButton({
    Key? key,
    required this.timeTerm,
    required this.price,
    required this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Icon(
            Icons.check_circle,
            size: 40,
            color: isEnabled ? Colors.blue : Colors.grey,
          ),
          Text(
            timeTerm,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          Text(
            '\$ ${price}/mo',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          Text('Billed Every ${timeTerm}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2)
        ]),
        height: 120,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: isEnabled
                ? Border.all(color: Colors.blue, width: 3)
                : Border.all(color: Colors.blueGrey, width: 3)));
  }
}
