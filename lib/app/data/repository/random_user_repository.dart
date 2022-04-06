import 'package:get/get_connect/http/src/response/response.dart';
import 'package:pharma/app/data/model/user/user_model.dart';
import 'package:pharma/app/data/provider/i_random_user_provider.dart';
import 'package:pharma/app/data/repository/i_random_user_repository.dart';

class RandomUserRepository implements IRandomUserRepository {
  final IRandomUserProvider provider;

  RandomUserRepository({required this.provider});
  @override
  Future<List<UserModel>> getListUsers(String qtd) async {
    final response = await provider.getListUsers(qtd);
    return response;
  }
}
