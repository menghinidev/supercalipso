import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:supercalipso/presenter/components/button/primary_elevated.dart';
import 'package:supercalipso/presenter/components/form/style/form_field_properties.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class SearchFormField<T> extends StatefulWidget {
  final String? label;
  final List<T> data;
  final Widget Function(T entry, String searchText) suggestionsMapper;
  final FutureOr<Iterable<T>> Function(String) onSearchFieldChanged;
  final Function()? onFocusAquired;
  final Function(T) onSuggestionTap;
  final Widget? emptyWidget;
  final Widget? trailing;
  final Widget? leading;

  const SearchFormField({
    required this.data,
    required this.suggestionsMapper,
    required this.onSearchFieldChanged,
    required this.onSuggestionTap,
    this.onFocusAquired,
    this.leading,
    this.trailing,
    this.label,
    this.emptyWidget,
    Key? key,
  }) : super(key: key);

  @override
  State<SearchFormField<T>> createState() => _SearchFormFieldState<T>();
}

class _SearchFormFieldState<T> extends State<SearchFormField<T>> with FormFieldProperties {
  late SuggestionsBoxController suggestionController;
  late TextEditingController fieldController;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    fieldController = TextEditingController();
    suggestionController = SuggestionsBoxController();
    if (widget.onFocusAquired != null) {
      focusNode.addListener(() {
        if (focusNode.hasFocus) {
          widget.onFocusAquired!();
        }
      });
    }
  }

  @override
  void dispose() {
    fieldController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField<T>(
      onSuggestionSelected: widget.onSuggestionTap,
      itemBuilder: (context, value) => widget.suggestionsMapper(value, fieldController.text),
      suggestionsCallback: widget.onSearchFieldChanged,
      getImmediateSuggestions: false,
      minCharsForSuggestions: 3,
      suggestionsBoxController: suggestionController,
      noItemsFoundBuilder: (context) => Center(
        child: NoResultsPlaceholder(
          searchedText: fieldController.text,
          onBack: () => suggestionController.close(),
        ),
      ),
      suggestionsBoxVerticalOffset: 0,
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Shapes.containerRadius.bottomLeft),
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 3),
        elevation: Dimensions.lowElevation,
      ),
      textFieldConfiguration: TextFieldConfiguration(
        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: AppColors.coolGrey11),
        controller: fieldController,
        focusNode: focusNode,
        decoration: decorationFactory.createSearchFieldDecoration(
          trailing: widget.trailing,
          label: widget.label,
          leading: widget.leading,
          color: Colors.white,
        ),
      ),
    );
  }
}

class NoResultsPlaceholder extends StatelessWidget {
  final Function()? onBack;
  final String searchedText;

  const NoResultsPlaceholder({required this.searchedText, this.onBack, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: Dimensions.mediumSize),
          child: Icon(
            Icons.sentiment_dissatisfied_outlined,
            size: 40,
            color: AppColors.coolGrey7,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Dimensions.largeSize).copyWith(
            left: Dimensions.largeSize,
            right: Dimensions.largeSize,
          ),
          child: Text(
            'No results for “$searchedText”',
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Dimensions.largeSize),
          child: PrimaryElevatedButton(text: 'Back', onTap: onBack),
        ),
      ],
    );
  }
}
