import 'package:donate/theme/global_theme.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
   const RoundedButton({Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextButton(
      onPressed: () => press(),
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.06,
        width: size.width * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: GlobalTheme.blue,

        ),
        child: Text(text,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
