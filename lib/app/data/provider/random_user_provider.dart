import 'package:get/get.dart';
import 'package:pharma/app/data/model/user/user_model.dart';
import 'package:pharma/app/data/provider/i_random_user_provider.dart';

class RandomUserProvider extends GetConnect implements IRandomUserProvider {
  @override
  Future<List<UserModel>> getListUsers(String qtd) async {
    var response = await get('https://randomuser.me/api/?results=${qtd}');

    if (response.statusCode == 200) {
      var data = listUserModelFromJson(response.body['results']);

      return data;
    } else {
      return [];
    }
  }
}
