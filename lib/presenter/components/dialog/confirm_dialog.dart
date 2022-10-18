import 'package:supercalipso/presenter/components/button/primary_elevated.dart';
import 'package:supercalipso/presenter/components/button/primary_outlined.dart';
import 'package:supercalipso/presenter/components/dialog/custom_dialog.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:supercalipso/services/modals/dialog/dialog_service.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final Widget? body;
  final String? textBody;
  final String? okButtonText;
  final String? noButtonText;

  const ConfirmDialog({
    required this.title,
    this.body,
    this.textBody,
    this.okButtonText,
    this.noButtonText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: title,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: Dimensions.mediumSize / 2.0, bottom: Dimensions.largeSize),
          child: body ?? Text(textBody ?? '', textAlign: TextAlign.center),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PrimaryOutlinedButton(
                text: noButtonText ?? 'Back',
                onTap: () => Navigator.pop(context, DialogResponse(hasDismissed: true)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: Dimensions.mediumSize / 2.0),
                child: PrimaryElevatedButton(
                  text: okButtonText ?? 'Confirm',
                  onTap: () => Navigator.pop(context, DialogResponse(hasConfirmed: true)),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
