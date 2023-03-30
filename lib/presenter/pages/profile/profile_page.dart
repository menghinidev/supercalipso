import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/auth/auth_provider.dart';
import 'package:supercalipso/application/team/team_service.dart';
import 'package:supercalipso/presenter/components/button/primary_icon.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/profile/sections/enrolled_teams.dart';
import 'package:supercalipso/presenter/pages/profile/sections/header.dart';
import 'package:supercalipso/presenter/pages/profile/sections/teams_invitations.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
      appBar: FlatAppBar(
        title: 'Profile',
        showProfileAvatar: false,
        actions: [
          PrimaryIconButton(
            icon: const Icon(Icons.logout),
            onTap: () => ref.read(authStateProvider.notifier).logout(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(teamInvitationsProvider.future),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            const SliverToBoxAdapter(child: ProfileHeader()),
            SliverPadding(
              padding: Dimensions.hPageInsets.copyWith(top: Dimensions.smallSize),
              sliver: const SliverToBoxAdapter(child: TeamsList()),
            ),
            SliverPadding(
              padding: Dimensions.pageInsetsWithTop,
              sliver: const SliverToBoxAdapter(child: TeamsInvitationSection()),
            ),
          ],
        ),
      ),
    );
  }
}
