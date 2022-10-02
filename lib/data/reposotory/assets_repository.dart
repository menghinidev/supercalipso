import 'package:supercalipso/data/model/asset/asset.dart';
import 'package:supercalipso/data/provider/assets_provider.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/services/installer.dart';

class AssetsRepository {
  final assetsProvider = Installer.instance.get<AssetsProvider>();
  AssetsRepository();

  Future<Response<List<Asset>>> getTeamAssets({required String teamId}) async {
    var assets = await assetsProvider.readTeamAssets(teamId: teamId);
    return assets;
  }
}
