import 'dart:convert';
import 'dart:io';
import 'package:flutter_quill_extensions/embeds/builders.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class HtmlEditor extends StatefulWidget {
  final String? placeholder;
  final String? initialValue;
  final bool isReadOnly;
  final bool showToolBar;
  final Function(String?)? onContentChanged;

  const HtmlEditor({
    this.placeholder,
    this.isReadOnly = false,
    this.showToolBar = true,
    this.onContentChanged,
    this.initialValue,
    Key? key,
  }) : super(key: key);

  @override
  State<HtmlEditor> createState() => _HtmlEditorState();
}

class _HtmlEditorState extends State<HtmlEditor> {
  final FocusNode _focusNode = FocusNode();
  late QuillController controller;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      try {
        var parsed = json.decode(widget.initialValue!);
        controller = QuillController(
          document: Document.fromJson(parsed),
          selection: const TextSelection.collapsed(offset: 0),
        );
      } catch (e) {
        controller = QuillController.basic();
        print('Eccezione in lettura');
      }
    } else {
      controller = QuillController.basic();
    }
    if (widget.onContentChanged != null) {
      controller.changes.listen((event) => widget.onContentChanged!(
            jsonEncode(event.item1.compose(event.item2).toJson()),
          ));
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.showToolBar) {
      return buildEditor(context);
    }
    return Column(
      children: <Widget>[
        Expanded(child: buildEditor(context)),
        if (widget.showToolBar)
          AnimatedOpacity(
            opacity: widget.isReadOnly ? 0 : 1,
            duration: const Duration(milliseconds: 500),
            child: QuillToolbar.basic(
              controller: controller,
              iconTheme: const QuillIconTheme(
                iconSelectedColor: AppColors.white,
                iconSelectedFillColor: AppColors.green,
                iconUnselectedFillColor: AppColors.white,
              ),
              showCodeBlock: false,
              showFontFamily: false,
              showInlineCode: false,
              showLink: true,
              showSmallButton: false,
              showBackgroundColorButton: false,
              showBoldButton: true,
              showStrikeThrough: false,
              showClearFormat: false,
              showColorButton: false,
              showListNumbers: false,
              showListCheck: false,
              showListBullets: true,
              showDirection: false,
              showQuote: false,
              showIndent: false,
              showFontSize: false,
              showSearchButton: false,
              showUndo: false,
              showRedo: false,
              showDividers: false,
              multiRowsDisplay: false,
              toolbarSectionSpacing: Dimensions.smallSize,
              embedButtons: FlutterQuillEmbeds.buttons(
                showCameraButton: false,
                showVideoButton: false,
                showFormulaButton: false,
                mediaPickSettingSelector: (context) => Future.value(MediaPickSetting.Gallery),
                onImagePickCallback: (file) async {
                  if (await file.exists()) {
                    return file.path;
                  }
                  return Future.value(null);
                },
              ),
            ),
          ),
      ],
    );
  }

  Widget buildEditor(BuildContext context) => QuillEditor(
        controller: controller,
        scrollController: ScrollController(),
        scrollable: true,
        focusNode: _focusNode,
        autoFocus: false,
        readOnly: widget.isReadOnly,
        showCursor: !widget.isReadOnly,
        placeholder: widget.placeholder,
        expands: false,
        padding: EdgeInsets.zero,
        textCapitalization: TextCapitalization.sentences,
        textSelectionControls: MaterialTextSelectionControls(),
        embedBuilders: [
          ...FlutterQuillEmbeds.builders(),
          ImageEmbedBuilder(),
        ],
        onImagePaste: (imageBytes) async {
          var file = File.fromRawPath(imageBytes);
          if (await file.exists()) {
            return file.path;
          }
          return Future.value(null);
        },
        customStyles: DefaultStyles(
          sizeSmall: Theme.of(context).textTheme.labelLarge,
          sizeLarge: Theme.of(context).textTheme.headlineMedium,
        ),
      );
}
