import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_service.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/bloc/utils.dart';
import 'package:supercalipso/presenter/components/button/primary_icon.dart';
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
        implyLeading: false,
        actions: [
          Consumer(
            builder: (context, ref, _) => PrimaryIconButton(
              icon: const Icon(Icons.logout),
              onTap: () => ref.read(authServiceProvider).logout(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ProfileHeader(),
            Consumer(
              builder: (context, ref, _) {
                var inv = ref.watch(pendingTeamInvitationsChangesProvider);
                return Text(
                  inv.onDefault(builder: (data) => data.length.toString(), defaultValue: ''),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
