import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/bloc/auth/auth_service.dart';

import 'package:supercalipso/presenter/components/button/primary_elevated.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/components/supercalipso_brand.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loggingState = ref.watch(authChanges);
    return CustomScaffold(
      body: Center(
        child: loggingState.when(
          data: (user) => user != null
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: Dimensions.hugeSize),
                      child: SuperCalipsoBrand(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PrimaryElevatedButton(
                          onTap: () => ref
                              .read(authServiceProvider)
                              .explicitLogin(email: 'lorenzo@email.com', password: 'password'),
                          text: 'LOGIN FIRST',
                        ),
                        PrimaryElevatedButton(
                          onTap: () => ref
                              .read(authServiceProvider)
                              .explicitLogin(email: 'lucavallo@email.com', password: 'password'),
                          text: 'LOGIN SECOND',
                        ),
                        PrimaryElevatedButton(
                          onTap: () => ref
                              .read(authServiceProvider)
                              .explicitLogin(email: 'lalligatore@email.com', password: 'password'),
                          text: 'LOGIN THIRD',
                        ),
                      ],
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
