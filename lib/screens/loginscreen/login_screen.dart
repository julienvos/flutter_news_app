import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_news/data/user_dao.dart';
import 'package:flutter_news/managers/app_state_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1555596899-d634257b55bb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYzNDI5NDAzOA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080')),
                      // The child of a round Card should be in round shape if it has a background color
                      shape: BoxShape.circle,
                      color: Theme.of(context).scaffoldBackgroundColor)),
              Text(
                'Brand News',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                'Up-To-Date',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              InlogForm(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Or sign in with a social account',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SocialIconButtons(),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => context.go('/login/signup'),
                  child: Text(
                    'Sign up',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SocialIconButtons extends StatelessWidget {
  const SocialIconButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () =>
                  context.read<AppStateManager>().signInWithFacebook(),
              icon: SocialIconContainer(
                socialIcon: FontAwesomeIcons.facebookSquare,
              )),
          SocialIconContainer(socialIcon: FontAwesomeIcons.twitterSquare),
          IconButton(
              onPressed: () =>
                  context.read<AppStateManager>().signInWithGoogle(),
              icon: SocialIconContainer(socialIcon: FontAwesomeIcons.google))
        ],
      ),
    );
  }
}

class SocialIconContainer extends StatelessWidget {
  final IconData socialIcon;
  const SocialIconContainer({
    Key? key,
    required this.socialIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 30,
        width: 100,
        child: FaIcon(socialIcon),
        decoration: BoxDecoration(
          border: Border.all(width: 1),
        ));
  }
}

class InlogForm extends StatelessWidget {
  InlogForm({
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    //consumer to catch error messages from the changenotifier (to display messages)

    return FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            FormBuilderTextField(
                name: 'Email',
                decoration: InputDecoration(hintText: 'Email'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.email(),
                  FormBuilderValidators.required(),
                ])),
            FormBuilderTextField(
              name: 'Password',
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
              validator: FormBuilderValidators.required(),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final String username =
                        _formKey.currentState!.fields['Email']!.value;
                    final String password =
                        _formKey.currentState!.fields['Password']!.value;

                    Provider.of<AppStateManager>(context, listen: false)
                        .login(username, password)
                        .then((response) {
                      if (response != null) {
                        final snackBar = SnackBar(
                          content: Text(response),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    });
                  }
                },
                child: Text('Sign in')),
            TextButton(
                onPressed: () {},
                child: Text('Forgot Password?'),
                style: TextButton.styleFrom(
                    textStyle: TextStyle(fontWeight: FontWeight.w300))),
          ]),
        ));
  }
}
