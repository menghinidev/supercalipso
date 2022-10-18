import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_service.dart';
import 'package:supercalipso/bloc/team/team_service.dart';
import 'package:supercalipso/presenter/components/button/primary_icon.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/profile/sections/enrolled_teams.dart';
import 'package:supercalipso/presenter/pages/profile/sections/header.dart';
import 'package:supercalipso/presenter/pages/profile/sections/teams_invitations.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';
import 'package:supercalipso/services/navigation/router_provider.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
      appBar: FlatAppBar(
        title: 'Profile',
        leading: BackButton(onPressed: () => ref.read(routerProvider).popOrHome()),
        showProfileAvatar: false,
        actions: [
          PrimaryIconButton(
            icon: const Icon(Icons.logout),
            onTap: () => ref.read(authServiceProvider).logout(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.wait([
          ref.read(teamServiceProvider).getTeamsInvitations(),
        ]),
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
