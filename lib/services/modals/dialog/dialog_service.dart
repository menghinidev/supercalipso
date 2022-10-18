import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dialogServiceProvider = Provider<DialogService>((ref) {
  return DialogService();
});

class DialogService {
  Future Function(Widget? child)? _showDialogListener;
  Completer<DialogResponse>? _dialogCompleter;

  void registerDialogListener(Future Function(Widget? child) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  Future<DialogResponse> showDialog({Widget? dialog, Function()? onDone}) {
    _dialogCompleter = Completer();
    if (_showDialogListener != null) {
      _showDialogListener!(dialog).then((value) => onDone != null ? onDone() : null);
      return _dialogCompleter!.future;
    }
    return _dialogCompleter!.future;
  }

  void dialogComplete(DialogResponse response) {
    if (_dialogCompleter != null) _dialogCompleter!.complete(response);
    _dialogCompleter = null;
  }
}

class DialogResponse {
  final dynamic value;
  final bool hasConfirmed;
  final bool hasDismissed;

  DialogResponse({this.value, this.hasConfirmed = false, this.hasDismissed = false});
}
