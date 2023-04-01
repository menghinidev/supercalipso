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

  Future showCustomDialog({required Widget Function(BuildContext context) dialogBuilder}) {
    var context = navKey.currentContext;
    if (context == null) return Future.value();
    return showDialog(context: context, builder: dialogBuilder);
  }

  Future showErrorDialog({String? error}) => showCustomDialog(
        dialogBuilder: (context) => ErrorDialog(error: error),
      );
}
