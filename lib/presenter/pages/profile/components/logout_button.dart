import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/presenter/components/button/primary_elevated.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: PrimaryElevatedButton(
        text: 'LOGOUT',
        onTap: () => ref.read(authProvider).logout(),
        color: Colors.lightGreen,
      ),
    );
  }
}
