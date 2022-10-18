import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.75,
      ),
      child: const CustomScaffold(
        appBar: FlatAppBar(
          showProfileAvatar: false,
          title: 'Notifications',
          leading: BackButton(),
        ),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [],
        ),
      ),
    );
  }
}
