import 'package:supercalipso/data/model/asset/asset.dart';
import 'package:supercalipso/data/provider/mocked.dart';
import 'package:supercalipso/plugin/utils.dart';

class AssetsProvider {
  var mocked = MockValues.instance;

  Future<Response<List<Asset>>> readTeamAssets({required String teamId}) {
    var assets = mocked.assets.where((element) => element.teamId == teamId).toList();
    return Future.value(Responses.success(assets));
  }
}
