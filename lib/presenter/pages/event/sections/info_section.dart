import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/pages/event/controller/event_page_state.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';
import 'package:supercalipso/services/localization/date_formatter_delegate.dart';

class EventInfoSection extends StatelessWidget with DateFormatter {
  final EventPageState state;
  const EventInfoSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return state.on(
      defaultValue: () => Container(),
      onReading: (state) => Padding(
        padding: const EdgeInsets.only(top: Dimensions.mediumSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.grey),
                children: [
                  const TextSpan(text: 'Last Update: '),
                  TextSpan(text: formatDateAndTime(state.event.lastUpdate)),
                ],
              ),
            ),
            if (state.creator != null)
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.grey),
                  children: [
                    const TextSpan(text: 'Created by: '),
                    TextSpan(text: state.creator!.displayName),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
