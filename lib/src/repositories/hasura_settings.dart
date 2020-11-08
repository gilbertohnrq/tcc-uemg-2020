import 'package:ezj_app/src/utils/env.dart';
import 'package:get/get.dart';
import 'package:hasura_connect/hasura_connect.dart';

class HasuraSettings extends GetxController {
  static HasuraSettings get to => Get.find();

  HasuraConnect connect = HasuraConnect(Env.GRAPHQL_API);
}
