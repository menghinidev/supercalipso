import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension DefaultFallbacks<T> on AsyncValue<T> {
  X onDefault<X>({
    required X Function(T data) builder,
    required X defaultValue,
  }) =>
      when(
        data: builder,
        error: (error, stackTrace) => defaultValue,
        loading: () => defaultValue,
      );

  X onValue<X>({
    required X Function(T data) builder,
    X Function()? loading,
    X Function(Object, StackTrace)? error,
  }) =>
      when(
        data: (data) => builder(data),
        error: error ?? (_, __) => Container() as X,
        loading: loading ?? () => Container() as X,
      );
}
