import 'package:get/get.dart';
import 'package:pharma/app/routes/app_pages.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  @override
  void onReady() {
    _loading();
    super.onReady();
  }

  // ignore: always_declare_return_types
  _loading() async {
    await 6.delay();
    Get.offAllNamed(Routes.HOME);
  }
}
