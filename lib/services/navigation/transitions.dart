import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/services/modals/dialog/dialog_manager.dart';
import 'package:supercalipso/services/modals/dialog/dialog_service.dart';

class BaseSupercalipsoPage extends StatelessWidget {
  final Widget page;

  const BaseSupercalipsoPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) => DialogManager(
        service: ref.watch(dialogServiceProvider),
        child: page,
      ),
    );
  }
}

class BasePageTransitionBuilder<T> extends CustomTransitionPage<T> {
  BasePageTransitionBuilder({required super.child, super.key})
      : super(
          transitionsBuilder: (context, primary, secondary, child) => FadeTransition(
            opacity: primary,
            child: BaseSupercalipsoPage(page: child),
          ),
        );
}
