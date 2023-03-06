import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/auth/auth_provider.dart';
import 'package:supercalipso/application/auth/auth_notifier.dart';
import 'package:supercalipso/application/utils.dart';
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
        child: loggingState.onValue(
          builder: (user) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: Dimensions.hugeSize),
                child: SuperCalipsoBrand(),
              ),
              SignInButton(
                Buttons.Google,
                shape: Shapes.lowRoundedBorder,
                onPressed: () => ref.read(authServiceProvider).loginWithGoogle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
