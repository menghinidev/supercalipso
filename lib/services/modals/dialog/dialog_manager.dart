import 'package:flutter/material.dart';
import 'package:supercalipso/services/modals/dialog/dialog_service.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  final DialogService service;
  const DialogManager({Key? key, required this.child, required this.service}) : super(key: key);

  @override
  State<DialogManager> createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  @override
  void initState() {
    super.initState();
    widget.service.registerDialogListener((builder) => _showDialog(
          context,
          customBuilder: builder != null ? () => builder : null,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  Future _showDialog(BuildContext context, {Widget Function()? customBuilder}) {
    return showDialog<DialogResponse>(
      context: context,
      builder: (context) => customBuilder != null ? customBuilder() : const AboutDialog(),
    ).then((value) => widget.service.dialogComplete(value ?? DialogResponse()));
  }
}
