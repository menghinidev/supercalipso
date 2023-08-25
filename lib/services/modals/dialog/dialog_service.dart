import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/presenter/components/dialog/error_dialog.dart';
import 'package:supercalipso/services/navigation/router/router.dart';

final dialogServiceProvider = Provider<DialogService>((ref) {
  return DialogService(ref.watch(navigatorKeyProvider));
});

class DialogService {
  final GlobalKey<NavigatorState> navKey;

  DialogService(this.navKey);

  Future<T?> showCustomDialog<T>({required Widget Function(BuildContext context) dialogBuilder}) {
    var context = navKey.currentContext;
    if (context == null) return Future.value();
    return showDialog<T>(context: context, builder: dialogBuilder);
  }

  Future showConfirmDialog({
    required Widget Function(BuildContext context) dialogBuilder,
    FutureOr Function()? onConfirmed,
  }) async {
    var context = navKey.currentContext;
    if (context == null) return Future.value();
    var confirm = await showDialog<bool>(context: context, builder: dialogBuilder);
    if (confirm == null || !confirm) return null;
    if (onConfirmed != null) await onConfirmed();
    return confirm;
  }

  Future showErrorDialog({String? error}) => showCustomDialog(
        dialogBuilder: (context) => ErrorDialog(error: error),
      );
}
