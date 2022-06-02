import 'package:flutter/material.dart';
import 'package:supercalipso/bloc/auth/auth_bloc.dart';
import 'package:supercalipso/bloc/auth/events.dart';
import 'package:supercalipso/plugin/bloc.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';

class LoginPage extends StatelessWidget with BlocRequester<AuthenticationBloc> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: TextButton(
          onPressed: () => getBloc(context).add(SilentLogin()),
          child: const Text('GO TO HOME'),
        ),
      ),
    );
  }
}
