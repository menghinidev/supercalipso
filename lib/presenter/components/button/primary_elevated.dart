import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/theme/colors.dart';

class PrimaryElevatedButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final TextStyle? textStyle;
  final Color? color;

  const PrimaryElevatedButton({required this.text, this.onTap, this.textStyle, this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        textStyle: textStyle,
        primary: color ?? AppColors.green,
        onPrimary: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Text(text),
    );
  }
}
