import 'package:flutter/material.dart';

class EmailSubscription extends StatefulWidget {
  const EmailSubscription({
    Key? key,
  }) : super(key: key);

  @override
  State<EmailSubscription> createState() => _EmailSubscriptionState();
}

class _EmailSubscriptionState extends State<EmailSubscription> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          color: Color.fromARGB(255, 224, 224, 224),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text('NewsLetter',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.bold, letterSpacing: 1)),
                  Icon(Icons.close)
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please enter your mail';
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(text)) {
                    return 'Please provide a valid email address';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Email submitted!")));
                    }
                    ;
                  },
                  child: Text('Subscribe')),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'You agree with our ',
                          style: Theme.of(context).textTheme.caption),

                      //TO DO:
                      // Add url launcher
                      TextSpan(
                        text: 'Terms of Policy',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Colors.blue),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
