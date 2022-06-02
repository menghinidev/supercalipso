import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:supercalipso/bloc/auth/auth_bloc.dart';
import 'package:supercalipso/bloc/auth/events.dart';
import 'package:supercalipso/plugin/bloc.dart';
import 'package:supercalipso/presenter/components/button/primary_elevated.dart';

class LogoutButton extends StatelessWidget with BlocRequester<AuthenticationBloc> {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PrimaryElevatedButton(
        text: 'LOGOUT',
        onTap: () => getBloc(context).add(Logout()),
        color: Colors.lightGreen,
      ),
    );
  }
}
