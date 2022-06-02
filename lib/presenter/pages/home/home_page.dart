import 'package:flutter/material.dart';
import 'package:supercalipso/plugin/bloc.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/profile/profile_page.dart';
import 'package:supercalipso/presenter/pages/teams/teams_page.dart';
import 'package:supercalipso/services/navigation/events.dart';
import 'package:supercalipso/services/navigation/navigation_bloc.dart';

class HomePage extends StatefulWidget {
  final int index;

  const HomePage({this.index = 0, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with BlocRequester {
  late PageController pageController;
  final pages = const [Dashboard(), TeamsPage(), ProfilePage()];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.index);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: pages,
          ),
        ),
        BottomNavigationBar(
          currentIndex: widget.index,
          onTap: _navigateToIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
            BottomNavigationBarItem(icon: Icon(Icons.people_alt_outlined), label: 'TEAMS'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'PROFILE'),
          ],
        ),
      ],
    );
  }

  void _navigateToIndex(int index) {
    late BlocEvent event;
    if (widget.index == index) return;
    if (index == 0) event = HomePageRequested();
    if (index == 1) event = TeamsPageRequested();
    if (index == 2) event = ProfilePageRequested();
    getAnyBloc<NavigationBloc>(context).add(event);
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(title: 'DASHBOARD'),
      body: Container(),
    );
  }
}
