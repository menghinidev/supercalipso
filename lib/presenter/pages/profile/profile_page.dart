import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/components/button/primary_icon.dart';
import 'package:supercalipso/presenter/components/button/simple_icon.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/profile/sections/header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: 'PROFILE',
        enableLeading: false,
        actions: [
          PrimaryIconButton(icon: Icon(Icons.notifications), onTap: () => print('ciao')),
          PrimaryIconButton(icon: Icon(Icons.settings), onTap: () => print('ciao')),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [ProfileHeader()],
        ),
      ),
    );
  }
}
