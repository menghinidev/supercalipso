import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/auth/auth_provider.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/presenter/pages/profile/components/profile_avatar.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class ProfileHeader extends HookConsumerWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var auth = ref.watch(authStateProvider);
    return auth.when(
      auth: (data) => ProfileInfoHeader(profile: data),
      unauth: () => const CircularProgressIndicator(),
    );
  }
}

class ProfileInfoHeader extends StatelessWidget {
  final User profile;

  const ProfileInfoHeader({required this.profile, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: Dimensions.pageInsetsWithTop,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: Dimensions.largeSize),
            alignment: Alignment.centerLeft,
            child: ProfileAvatar(imageURL: profile.imageURL, size: 40.0),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: Dimensions.tinySize),
            child: Text(
              profile.displayName,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Text(
            profile.email,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
