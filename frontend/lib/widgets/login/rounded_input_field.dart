import 'package:donate/theme/global_theme.dart';
import 'package:flutter/material.dart';
import './text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Function onSaved;
  const RoundedInputField({
    required this.hintText,
    this.icon = Icons.person,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        style: const TextStyle(
          color: GlobalTheme.darkGrey,
          fontSize: 18,
        ),
        validator: (value) {
          if (value!.isEmpty || !value.contains('@')) {
            return 'invalid email';
          }
        },
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) => onSaved(),
        textInputAction: TextInputAction.next,
        cursorColor: GlobalTheme.darkGrey,
        decoration: InputDecoration(
          labelStyle: Theme.of(context).textTheme.headline4,
          errorStyle:const TextStyle(
            color: GlobalTheme.customErrorRed,
            fontSize: 18,
          ),
          labelText: 'Email',
          icon: Icon(
            icon,
            color: GlobalTheme.blue,
          ),
          //hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
