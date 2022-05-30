import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_news/data/user_dao.dart';
import 'package:flutter_news/managers/app_state_manager.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //for the keyboard
      appBar: AppBar(),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Sign up',
              style: Theme.of(context).textTheme.headline5,
            ),
            FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'name',
                      decoration: InputDecoration(hintText: 'name'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.min(4),
                        FormBuilderValidators.required()
                      ]),
                    ),
                    FormBuilderTextField(
                      name: 'Email',
                      decoration: InputDecoration(hintText: 'Email'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email()
                      ]),
                    ),
                    FormBuilderTextField(
                        obscureText: true,
                        validator: FormBuilderValidators.required(),
                        name: 'Password',
                        decoration: InputDecoration(hintText: 'Password')),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            final String email =
                                _formKey.currentState!.fields['Email']!.value;
                            final String password = _formKey
                                .currentState!.fields['Password']!.value;

                            //sign up
                            Provider.of<AppStateManager>(context, listen: false)
                                .signup(email, password);
                          }
                        },
                        child: Text('create Account')),
                    Text('By signing up, bla, bla bla')
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
