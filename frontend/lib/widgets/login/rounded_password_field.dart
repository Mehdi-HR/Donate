import 'package:flutter/material.dart';
import '../../theme/global_theme.dart';
import './text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final Function onSaved;
  final Function onFieldSubmitted;
//ValueChanged<String>
  const RoundedPasswordField({
    required this.onSaved,
    required this.onFieldSubmitted,
  });

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        style: const TextStyle(
          color: GlobalTheme.darkGrey,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Invalid password';
          }
        },
        onFieldSubmitted: (value) => widget.onFieldSubmitted(),
        onSaved: (value) => widget.onSaved(),
        obscureText: _isHidden,
        cursorColor: GlobalTheme.darkGrey,
        decoration: InputDecoration(
          labelStyle: Theme.of(context).textTheme.headline4,
          errorStyle: const TextStyle(
            color:  GlobalTheme.customErrorRed,
            fontSize: 18,
          ),
          labelText: 'Password',
          //hintText: "Entrer votre mot de passe",
          icon: const Icon(
            Icons.lock,
            color: GlobalTheme.blue,
          ),
          suffix: InkWell(
            onTap: _togglePasswordView,
            child: Icon(
              _isHidden ? Icons.visibility : Icons.visibility_off,
              color: GlobalTheme.blue,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
