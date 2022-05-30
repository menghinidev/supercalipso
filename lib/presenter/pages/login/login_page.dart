import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supercalipso/plugin/bloc.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/services/navigation/navigation_bloc.dart';

class LoginPage extends StatelessWidget with BlocRequester {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: TextButton(
          onPressed: () => getAnyBloc<NavigationBloc>(context).add(GoTo(pageBuilder: (context) => context.go('/home'))),
          child: const Text('GO TO HOME'),
        ),
      ),
    );
  }
}
