import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/provider/api/user/i_user_data_source.dart';
import 'package:supercalipso/data/provider/command/user/create/register_user_command.dart';
import 'package:supercalipso/data/provider/mocked.dart';
import 'package:supercalipso/plugin/utils.dart';

class UserMockedDataSource extends IUserDataSource with IdentifierFactory {
  final mocked = MockValues.instance;

  @override
  Future<Response<User>> getUserByEmail({required String email}) {
    var user = mocked.users.getWhere((element) => element.email == email);
    if (user == null) return Future.value(Responses.failure([]));
    return Future.value(Responses.success(user));
  }

  @override
  Future<Response<User>> getUserByUserId({required String userId}) {
    var user = mocked.users.getWhere((element) => element.uid == userId);
    if (user == null) return Future.value(Responses.failure([]));
    return Future.value(Responses.success(user));
  }

  @override
  Future<Response<User>> registerUser({required RegisterUserCommand command}) {
    var user = User(
      uid: command.uid,
      displayName: command.displayName,
      email: command.email,
    );
    mocked.users.add(user);
    return Future.value(Responses.success(user));
  }
}
