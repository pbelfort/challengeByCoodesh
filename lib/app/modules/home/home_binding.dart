import 'package:get/get.dart';
import 'package:pharma/app/data/provider/i_random_user_provider.dart';
import 'package:pharma/app/data/provider/random_user_provider.dart';
import 'package:pharma/app/data/repository/i_random_user_repository.dart';
import 'package:pharma/app/data/repository/random_user_repository.dart';

import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IRandomUserProvider>(() => RandomUserProvider());
    Get.lazyPut<IRandomUserRepository>(
        () => RandomUserRepository(provider: Get.find()));

    Get.put(HomePageController(randomUserRepository: Get.find()));
  }
}
