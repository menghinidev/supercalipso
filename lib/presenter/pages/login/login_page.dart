import 'package:flutter/material.dart';
import 'package:supercalipso/bloc/auth/auth_bloc.dart';
import 'package:supercalipso/bloc/auth/events.dart';
import 'package:supercalipso/plugin/bloc.dart';
import 'package:supercalipso/presenter/components/button/primary_elevated.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/components/supercalipso_brand.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class LoginPage extends StatelessWidget with BlocRequester<AuthenticationBloc> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: Dimensions.hugeSize),
              child: SuperCalipsoBrand(),
            ),
            PrimaryElevatedButton(
              onTap: () => getBloc(context).add(SilentLogin()),
              text: 'LOGIN',
            ),
          ],
        ),
      ),
    );
  }
}
