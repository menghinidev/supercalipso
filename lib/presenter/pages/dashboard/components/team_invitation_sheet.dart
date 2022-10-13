import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/bloc/utils.dart';
import 'package:supercalipso/presenter/components/bottomsheet/custom_bottom_sheet.dart';
import 'package:supercalipso/presenter/components/common/empty_data_widget.dart';
import 'package:supercalipso/presenter/pages/dashboard/components/team_invitation_tile.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class TeamInvitationBottomSheet extends HookConsumerWidget {
  const TeamInvitationBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var invitations = ref.watch(pendingTeamInvitationsChangesProvider);
    return CustomBottomSheet(
      constraints: const BoxConstraints.expand(height: 400),
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          Expanded(
            child: Padding(
              padding: Dimensions.mHsTPadding,
              child: invitations.onValue(
                builder: (value) => EmptyDataWidgetBuilder(
                  emptyCondition: () => value.isEmpty,
                  placeholderBuilder: (context) => const Text('No pendinig invitations'),
                  builder: (context) => ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => TeamInvitationTile(invitation: value[index]),
                    separatorBuilder: (context, index) => const SizedBox(height: Dimensions.smallSize),
                    itemCount: value.length,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
