import 'package:supercalipso/data/provider/mocked.dart';
import 'package:supercalipso/plugin/utils.dart';

class LocalStorageProvider {
  Future<Response<String>> readCachedUserId() => Future.value(Responses.success(MockValues.instance.firstUser.id));
}
