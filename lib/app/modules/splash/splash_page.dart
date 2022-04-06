import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharma/app/modules/splash/splash_controller.dart';
import 'package:pharma/app/modules/widgets/logo_pharma.dart';
import 'package:pharma/app/theme/app_colors.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.green),
      child: Center(
        child: Center(
          child: LogoPharma(
            width: 300.w,
            height: 300.h,
          ),
        ),
      ),
    );
  }
}
