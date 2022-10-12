import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/bloc/team/team_service.dart';
import 'package:supercalipso/presenter/components/bottomsheet/custom_bottom_sheet.dart';
import 'package:supercalipso/presenter/components/button/primary_elevated.dart';
import 'package:supercalipso/presenter/components/common/loading_list.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class TeamInvitationGeneratorSheet extends HookConsumerWidget {
  final String teamId;

  const TeamInvitationGeneratorSheet({Key? key, required this.teamId}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var team = ref.watch(teamChangesProvider(teamId));
    var controller = useTextEditingController();
    return CustomBottomSheet(
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          Padding(
            padding: Dimensions.mHsTPadding.copyWith(top: 0),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                label: Text('Email'),
                hintText: "Inserisci l'email dell'utente",
                counterText: '',
              ),
              maxLines: 1,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: Dimensions.allMPadding,
            child: team.when(
              data: (data) => PrimaryElevatedButton(
                text: 'Invita',
                onTap: () {
                  ref.read(teamServiceProvider).inviteUserToTeam(
                        email: controller.text,
                        teamId: data.id,
                      );
                  Navigator.pop(context);
                },
              ),
              error: (_, __) => Container(),
              loading: () => const LoadingList(),
            ),
          ),
        ],
      ),
    );
  }
}
