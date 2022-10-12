import 'package:flutter/material.dart';

class PrimaryOutlinedButton extends StatelessWidget {
  final String text;
  final Color? backgroudColor;
  final Color? textColor;
  final Function()? onTap;

  const PrimaryOutlinedButton({required this.text, this.onTap, this.backgroudColor, this.textColor, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: ButtonStyleButton.allOrNull(backgroudColor),
        side: ButtonStyleButton.allOrNull(backgroudColor == null ? null : BorderSide(color: backgroudColor!)),
        textStyle: ButtonStyleButton.allOrNull(Theme.of(context).textTheme.labelLarge!.copyWith(color: textColor)),
      ),
      child: Text(text),
    );
  }
}
