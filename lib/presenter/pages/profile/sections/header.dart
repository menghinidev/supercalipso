import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/data/model/user/user.dart';

import 'package:supercalipso/presenter/components/avatar/custom_avatar.dart';
import 'package:supercalipso/presenter/pages/profile/components/logout_button.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  final headerKey = GlobalKey();
  final statusKey = GlobalKey();

  double headerHeight = 0.0;
  double statusHeight = 0.0;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      var headerContext = headerKey.currentContext;
      if (headerContext == null) return;
      if (headerContext.size == null) return;
      headerHeight = headerContext.size!.height;
      var statusContext = statusKey.currentContext;
      if (statusContext == null) return;
      statusHeight = statusContext.size!.height;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var auth = ref.watch(authChanges);
      return auth.when(
        data: (user) => user == null
            ? Container()
            : SizedBox(
                height: headerHeight == 0 ? 1 : headerHeight + (statusHeight * 1.5),
                width: double.infinity,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: ProfileInfoHeader(key: headerKey, profile: user, bottomMargin: statusHeight),
                    ),
                    Positioned(
                      left: Dimensions.pageInsetsSize,
                      right: Dimensions.pageInsetsSize,
                      bottom: 0,
                      child: LogoutButton(key: statusKey),
                    ),
                  ],
                ),
              ),
        error: (_, stack) => Text('Error: $stack'),
        loading: () => const CircularProgressIndicator(),
      );
    });
  }
}

class ProfileInfoHeader extends StatelessWidget {
  final User profile;
  final double bottomMargin;

  const ProfileInfoHeader({required this.profile, this.bottomMargin = 0, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blue.withOpacity(0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(Dimensions.largeSize),
            alignment: Alignment.center,
            child: CustomAvatar(name: profile.name, radius: 40.0),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Dimensions.mediumSize + bottomMargin),
            child: Text(
              profile.name,
              style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
