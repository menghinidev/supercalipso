import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/components/dialog/confirm_dialog.dart';

class ErrorDialog extends StatelessWidget {
  final String? error;
  const ErrorDialog({super.key, this.error = 'Something went wrong'});

  @override
  Widget build(BuildContext context) {
    return ConfirmDialog(
      title: 'Ops, an error occurred',
      textBody: error,
      okButtonText: 'Report',
      noButtonText: 'Dismiss',
    );
  }
}
