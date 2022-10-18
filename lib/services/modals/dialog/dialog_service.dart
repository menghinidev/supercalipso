import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/presenter/components/dialog/error_dialog.dart';

final dialogServiceProvider = Provider<DialogService>((ref) {
  return DialogService();
});

class DialogService {
  Future<DialogResponse> Function(Widget? child)? _showDialogListener;
  Completer<DialogResponse>? _dialogCompleter;

  void registerDialogListener(Future<DialogResponse> Function(Widget? child) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  Future<DialogResponse> showDialog({
    Widget? dialog,
    Function(DialogResponse response)? onConfirmed,
    Function(DialogResponse response)? onDismissed,
  }) {
    _dialogCompleter = Completer();
    if (_showDialogListener != null) {
      _showDialogListener!(dialog).then((value) {
        if (value.hasConfirmed && onConfirmed != null) {
          onConfirmed(value);
          return value;
        } else if (value.hasDismissed && onDismissed != null) {
          onDismissed(value);
          return value;
        }
      });
      return _dialogCompleter!.future;
    }
    return _dialogCompleter!.future;
  }

  Future<DialogResponse> showErrorDialog({String? error}) => showDialog(dialog: ErrorDialog(error: error));

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
