import 'package:flutter/material.dart';
import 'package:supercalipso/services/navigation/navigation_bloc.dart';

class CustomScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget body;

  const CustomScaffold({required this.body, this.appBar, this.bottomNavigationBar, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBlocStateListener(
      child: Scaffold(
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
