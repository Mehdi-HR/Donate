import 'package:donate/theme/global_theme.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: size.width * 0.8,
      height: size.height * 0.075,
      decoration: BoxDecoration(
        color: GlobalTheme.appBarWhite,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
