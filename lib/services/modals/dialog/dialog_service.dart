import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/services/navigation/router_provider.dart';

final dialogServiceProvider = Provider<DialogService>((ref) {
  return DialogService();
});

class DialogService {
  Future Function(Widget? child)? _showDialogListener;
  Completer? _dialogCompleter;

  void registerDialogListener(Future Function(Widget? child) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  Future showDialog({Widget? dialog, Function()? onDone}) {
    _dialogCompleter = Completer();
    if (_showDialogListener != null) {
      _showDialogListener!(dialog).then((value) => onDone != null ? onDone() : null);
      return _dialogCompleter!.future;
    }
    return _dialogCompleter!.future;
  }

  void dialogComplete() {
    if (_dialogCompleter != null) _dialogCompleter!.complete();
    _dialogCompleter = null;
  }
}
