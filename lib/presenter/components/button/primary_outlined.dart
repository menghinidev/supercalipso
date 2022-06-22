import 'package:flutter/material.dart';

class PrimaryOutlinedButton extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const PrimaryOutlinedButton({required this.text, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      child: Text(text),
    );
  }
}
