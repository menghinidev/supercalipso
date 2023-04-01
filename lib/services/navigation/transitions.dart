import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BasePageTransitionBuilder<T> extends CustomTransitionPage<T> {
  BasePageTransitionBuilder({required super.child, super.key})
      : super(
          transitionsBuilder: (context, primary, secondary, child) => FadeTransition(
            opacity: primary,
            child: child,
          ),
        );
}
