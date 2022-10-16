import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/provider/api/user/i_user_data_source.dart';
import 'package:supercalipso/plugin/utils/response.dart';
import 'package:supercalipso/data/provider/command/user/create/register_user_command.dart';

class UserMockedDataSource extends IUserDataSource {
  @override
  Future<Response<User>> getUserByEmail({required String email}) {
    // TODO: implement getUserByEmail
    throw UnimplementedError();
  }

  @override
  Future<Response<User>> getUserByUserId({required String userId}) {
    // TODO: implement getUserByUserId
    throw UnimplementedError();
  }

  @override
  Future<Response<User>> registerUser({required RegisterUserCommand command}) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }
}
