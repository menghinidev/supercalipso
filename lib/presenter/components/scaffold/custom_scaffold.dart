import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget body;
  final Widget? drawer;
  final Widget? fab;

  const CustomScaffold({
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.drawer,
    this.fab,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: body,
      floatingActionButton: fab,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
