import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final assetManagerProvider = Provider<AssetManager>((ref) {
  return AssetManager();
});

class AssetManager {
  Image getImage(SuperCalipsoAssets asset) => Image.asset(_buildAssetPath(asset));

  String _buildAssetPath(SuperCalipsoAssets asset) {
    return 'assets/images/supercalipso.png';
  }
}

enum SuperCalipsoAssets {
  logo;
}
