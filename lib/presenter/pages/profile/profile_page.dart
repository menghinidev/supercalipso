import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_service.dart';
import 'package:supercalipso/presenter/components/button/primary_icon.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/profile/sections/enrolled_teams.dart';
import 'package:supercalipso/presenter/pages/profile/sections/header.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
      appBar: FlatAppBar(
        title: 'Profile',
        leading: const BackButton(),
        showProfileAvatar: false,
        actions: [
          PrimaryIconButton(
            icon: const Icon(Icons.logout),
            onTap: () => ref.read(authServiceProvider).logout(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ProfileHeader(),
            Padding(
              padding: Dimensions.pageInsetsWithTop,
              child: const TeamsList(),
            ),
          ],
        ),
      ),
    );
  }
}
