import 'dart:async';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/provider/api/user/i_user_data_source.dart';
import 'package:supercalipso/plugin/utils.dart';

class AuthRepository {
  final IUserDataSource dataSource;

  AuthRepository({required this.dataSource});

  Future<Response<User>> getUserByEmail({required String email}) async {
    var user = await dataSource.getUserByEmail(email: email);
    return user;
  }

  Future<Response<User>> getUserById({required String id}) async {
    var user = await dataSource.getUserByUserId(userId: id);
    return user;
  }
}
