import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/theme/colors.dart';

class CustomAvatar extends StatelessWidget {
  final String name;
  final double radius;
  final TextStyle? textStyle;
  final Color? color;

  const CustomAvatar({required this.name, this.radius = 20.0, this.textStyle, this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color ?? AppColors.blue,
      radius: radius,
      child: Text(
        getInitials(name).toUpperCase(),
        textAlign: TextAlign.center,
        style: textStyle ?? Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
      ),
    );
  }

  String getInitials(String name) {
    var splitted = name.split(' ');
    if (splitted.length == 1) {
      return name.substring(0, 2);
    } else {
      var result = '';
      for (var part in splitted) {
        result += part[0];
      }
      return result;
    }
  }
}
