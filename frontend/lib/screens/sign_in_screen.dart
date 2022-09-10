import 'package:donate/screens/menu_screen.dart';
import 'package:flutter/material.dart';

import '../theme/global_theme.dart';
import '../widgets/login/rounded_button.dart';
import '../widgets/login/rounded_input_field.dart';
import '../widgets/login/rounded_password_field.dart';

class SignInScreen extends StatefulWidget{

  final String title;
  const SignInScreen({Key? key, required this.title}) : super(key: key);
  static const namedRoute = '/sign_in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _form = GlobalKey<FormState>();
  var authData = {
    'email': '',
    'password': '',
  };
  void _saveForm() {
    final isValid = _form.currentState?.validate();
    if (!isValid!) return;
    _form.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      title: const Text('Sign in'),
    );
    final height = _mediaQuery.size.height -
        _mediaQuery.padding.top -
        appBar.preferredSize.height;
    final width = _mediaQuery.size.width;

    return Scaffold(
      backgroundColor : Theme.of(context).backgroundColor,
      appBar: appBar,
      body: Center(
        child: Container(
          width: double.infinity, 
          margin: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Form(
                key: _form,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.01),
                    Image(
                      image: const AssetImage( "assets/img/logo_m.png"),
                      height: size.height * 0.25,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome ',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.headline1?.color,
                            fontSize: Theme.of(context).textTheme.headline1?.fontSize,
                        ),
                        ),
                        Text(
                          'back! ',
                          style: TextStyle(
                            color: GlobalTheme.blue,
                            fontSize: Theme.of(context).textTheme.headline1?.fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.01),
                    RoundedInputField(
                      hintText: "Enter your email ",
                      onSaved: (value) {
                        authData['email'] = value;
                      },
                    ),
                    RoundedPasswordField(
                      onFieldSubmitted: (_) => _saveForm(),
                      onSaved: (value) {
                        authData['password'] = value;
                      },
                    ),
                    SizedBox(height: size.height * 0.2),

                    RoundedButton(
                        //color: Theme.of(context).textTheme.headline1!.color!,
                        text: "Sign in",
                        press: /*() {
                          _saveForm();
                          Provider.of<User>(context, listen: false).authenticate(
                            email: authData['email'],
                            password: authData['password'],
                          );
                          Navigator.pushNamed(context, '/');
                        }*/
                      () {
                        Navigator.pushNamed(context, MenuScreen.namedRoute);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}