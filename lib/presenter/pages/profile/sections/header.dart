import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/presenter/pages/profile/components/profile_avatar.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class ProfileHeader extends StatefulHookConsumerWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends ConsumerState<ProfileHeader> {
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
    var auth = ref.watch(authChanges);
    return auth.when(
      data: (data) => data == null ? Container() : ProfileInfoHeader(profile: data),
      error: (_, stack) => Text('Error: $stack'),
      loading: () => const CircularProgressIndicator(),
    );
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
            child: ProfileAvatar(imageURL: profile.imageURL, size: 40.0),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Dimensions.mediumSize + bottomMargin),
            child: Text(
              profile.displayName,
              style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
