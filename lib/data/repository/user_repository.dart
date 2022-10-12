import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/provider/user_provider.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/services/installer.dart';

class UserRepository {
  final provider = Installer.instance.get<UserProvider>();

  Future<Response<User>> getUserByEmail({required String email}) async {
    var user = await provider.readUserByEmail(email: email);
    return user;
  }
}
