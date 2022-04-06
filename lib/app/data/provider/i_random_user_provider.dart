import 'package:get/get_connect.dart';
import 'package:pharma/app/data/model/user/user_model.dart';

abstract class IRandomUserProvider {
  Future<List<UserModel>> getListUsers(String qtd);
}
