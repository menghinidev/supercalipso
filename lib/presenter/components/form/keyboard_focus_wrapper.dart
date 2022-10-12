import 'package:flutter/material.dart';

class KeyboardFocusWrapper extends StatelessWidget {
  final Widget child;
  const KeyboardFocusWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScopeNode = FocusScope.of(context);
        if (!focusScopeNode.hasPrimaryFocus) {
          focusScopeNode.unfocus();
        }
      },
      child: child,
    );
  }
}
