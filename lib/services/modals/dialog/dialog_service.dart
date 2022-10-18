import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dialogServiceProvider = Provider<DialogService>((ref) {
  return DialogService();
});

class DialogService {
  Function(Widget? child)? _showDialogListener;
  Completer? _dialogCompleter;

  void registerDialogListener(Function(Widget? child) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  Future showDialog({Widget? dialog}) {
    _dialogCompleter = Completer();
    if (_showDialogListener != null) {
      _showDialogListener!(dialog);
      return _dialogCompleter!.future;
    }
    return _dialogCompleter!.future;
  }

  void dialogComplete() {
    if (_dialogCompleter != null) _dialogCompleter!.complete();
    _dialogCompleter = null;
  }
}
