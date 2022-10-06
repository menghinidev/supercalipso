import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/provider/mocked.dart';
import 'package:supercalipso/plugin/utils.dart';

class UserProvider {
  final mocked = MockValues.instance;

  Future<Response<User>> readUserByEmail({required String email}) {
    var user = mocked.users.getWhere((element) => element.email == email);
    if (user == null) return Future.value(Responses.failure([]));
    return Future.value(Responses.success(user));
  }
}
