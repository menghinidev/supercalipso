import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/provider/api/user/i_user_data_source.dart';
import 'package:supercalipso/plugin/utils/response.dart';
import 'package:supercalipso/data/provider/command/user/create/register_user_command.dart';

class UserFirestoreDataSource extends IUserDataSource {
  final collectionPath = 'users';
  var firestore = FirebaseFirestore.instance;

  @override
  Future<Response<User>> getUserByUserId({required String userId}) async {
    var users = await firestore.collection(collectionPath).where('uid', isEqualTo: userId).get();
    if (users.docs.isEmpty) return Responses.failure([]);
    var user = users.docs.first;
    return Responses.success(User.fromJson(user.data()));
  }

  @override
  Future<Response<User>> registerUser({required RegisterUserCommand command}) async {
    var user = await firestore.collection(collectionPath).add(command.toJson());
    var data = await user.get();
    return Responses.success(User.fromJson(data.data()!));
  }

  @override
  Future<Response<User>> getUserByEmail({required String email}) async {
    var users = await firestore.collection(collectionPath).where('email', isEqualTo: email).get();
    if (users.docs.isEmpty) return Responses.failure([]);
    var user = users.docs.first;
    return Responses.success(User.fromJson(user.data()));
  }
}
