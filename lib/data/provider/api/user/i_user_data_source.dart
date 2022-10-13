import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/provider/command/user/create/register_user_command.dart';
import 'package:supercalipso/plugin/utils/response.dart';

abstract class IUserDataSource {
  Future<Response<User>> getUserByUserId({required String userId});
  Future<Response<User>> getUserByEmail({required String email});
  Future<Response<User>> registerUser({required RegisterUserCommand command});
}
