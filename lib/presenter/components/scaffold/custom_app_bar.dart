import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/presenter/pages/profile/components/profile_avatar.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';
import 'package:supercalipso/services/navigation/router_provider.dart';
import 'package:supercalipso/services/navigation/routes.dart';

/* class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final List<Widget> actions;
  final Widget? leading;
  final bool implyLeading;
  final double borderHeight = 1;

  const CustomAppBar({
    this.title,
    this.actions = const <Widget>[],
    this.implyLeading = true,
    this.leading,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? ''),
      actions: actions
          .map<Widget>((e) => actions.last == e
              ? Padding(
                  padding: const EdgeInsets.only(right: Dimensions.mediumSize),
                  child: e,
                )
              : e)
          .toList(),
      leading: implyLeading ? null : leading ?? Container(),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(borderHeight),
        child: Container(
          color: AppColors.blue,
          height: borderHeight,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
} */

class FlatAppBar extends HookConsumerWidget with PreferredSizeWidget {
  final String? title;
  final List<Widget> actions;
  final Widget? leading;
  final bool showProfileAvatar;

  const FlatAppBar({
    this.title,
    this.leading,
    this.actions = const <Widget>[],
    this.showProfileAvatar = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(title ?? ''),
      actions: [
        ...actions.map((e) => Padding(
              padding: const EdgeInsets.only(right: Dimensions.smallSize),
              child: e,
            )),
        showProfileAvatar
            ? Padding(
                padding: const EdgeInsets.only(right: Dimensions.pageInsetsSize),
                child: GestureDetector(
                  onTap: () => ref.read(routerProvider).push(ProfilePageRoute.pagePath),
                  child: const LoggedUserAvatar(),
                ),
              )
            : Container(),
      ],
      automaticallyImplyLeading: false,
      centerTitle: false,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
