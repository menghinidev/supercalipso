import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/services/assets/asset_manager.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var assetManger = ref.watch(assetManagerProvider);
    return CustomScaffold(
      body: Expanded(
        child: Center(
          child: assetManger.getImage(SuperCalipsoAssets.logo),
        ),
      ),
    );
  }
}
