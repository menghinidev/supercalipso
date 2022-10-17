import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PrimaryTextButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const PrimaryTextButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onTap, child: Text(text));
  }
}
