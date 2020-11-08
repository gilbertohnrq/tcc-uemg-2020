import 'package:ezj_app/models/user.dart';
import 'package:ezj_app/src/repositories/hasura_settings.dart';
import 'package:ezj_app/src/repositories/queries/user_queries.dart';
import 'package:get/get.dart';

class UserRepository {
  final hasuraSettings = Get.find<HasuraSettings>();

  static UserRepository get to => Get.find();

  Future<User> getUserByEmail(String email) async {
    var query = UserQueries.USER_BY_EMAIL;
    try {
      var snapshot = await hasuraSettings.connect
          .query(query, variables: {"email": email});
      return User.fromMap(snapshot["data"]["users"][0]);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User> adduser(User user) async {
    var query = UserQueries.ADD_USER;

    try {
      var snapshot =
          await hasuraSettings.connect.mutation(query, variables: user.toMap());
      print(snapshot);
      return User.fromMap(snapshot["data"]["insert_users_one"]);
    } catch (e) {
      print(e);
      throw new Exception(e);
    }
  }
}
