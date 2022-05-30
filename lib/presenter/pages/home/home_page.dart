import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supercalipso/plugin/bloc.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/login/login_page.dart';
import 'package:supercalipso/services/navigation/navigation_bloc.dart';

class HomePage extends StatelessWidget with BlocRequester {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: 'SuperCalipso'),
      body: Center(
        child: TextButton(
          onPressed: () => getAnyBloc<NavigationBloc>(context).add(
            GoTo(pageBuilder: (context) => context.go('/')),
          ),
          child: const Text('BACK TO LOGIN'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(icon: Icon(Icons.people_alt_outlined), label: 'TEAMS'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'PROFILE'),
        ],
      ),
    );
  }
}
