import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';

import 'package:supercalipso/presenter/components/button/primary_elevated.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/components/supercalipso_brand.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loggingState = ref.watch(authChanges);
    return CustomScaffold(
      body: Center(
        child: loggingState.when(
          data: (user) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: Dimensions.hugeSize),
                child: SuperCalipsoBrand(),
              ),
              PrimaryElevatedButton(
                onTap: () => ref.read(authProvider).explicitLogin(email: 'email', password: 'password'),
                text: 'LOGIN',
              ),
            ],
          ),
          error: (obj, stack) => Text('Error: $stack'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
