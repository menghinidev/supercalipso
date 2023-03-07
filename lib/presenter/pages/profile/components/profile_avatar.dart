import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/auth/auth_provider.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageURL;
  final double? size;

  static const String fallback =
      'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=1480&t=st=1665757793~exp=1665758393~hmac=444177a0181d27d80ee8c3a6f4599a294a8217dacd13f64a6c992e9de5ecf783';

  const ProfileAvatar({super.key, this.imageURL, this.size});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(imageURL ?? fallback),
      radius: size,
    );
  }
}

class LoggedUserAvatar extends HookConsumerWidget {
  const LoggedUserAvatar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var user = ref.watch(authStateProvider);
    return ProfileAvatar(
      imageURL: user.whenOrNull<String?>(
        data: (data) => data.whenOrNull<String?>(auth: (user) => user.imageURL),
      ),
    );
  }
}
