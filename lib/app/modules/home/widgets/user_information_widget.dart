import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pharma/app/modules/home/home_controller.dart';
import 'package:pharma/app/theme/app_colors.dart';
import 'package:pharma/app/theme/app_text_styles.dart';

class UserInformationWidgert extends GetView<HomePageController> {
  final int index;

  const UserInformationWidgert({Key? key, required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: Builder(
              builder: (context) {
                return SizedBox(
                  height: 400,
                  width: Get.width,
                );
              },
            ),
          )
        ]),
        Padding(
          padding: EdgeInsets.only(top: Get.height / 2.5, left: Get.width - 50),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.close),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: Get.height / 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(
                        controller.foundUsers.value[index].picture!.medium!),
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                controller.foundUsers.value[index].name!.first.toString() +
                    ' ' +
                    controller.foundUsers.value[index].name!.last.toString(),
                style: AppTextStyles.textBold18.merge(
                    TextStyle(fontSize: 20.sp, color: AppColors.darkBlue)),
              ),
              Text(
                controller.foundUsers.value[index].login!.uuid.toString(),
                style: AppTextStyles.textBold16
                    .merge(const TextStyle(color: AppColors.darkBlue)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0.h, top: 10.w),
                child: Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Email: ',
                            style: AppTextStyles.textBold16.merge(
                                const TextStyle(color: AppColors.darkBlue)),
                          ),
                          TextSpan(
                            text: controller.foundUsers.value[index].email
                                .toString(),
                            style: AppTextStyles.textRegular14.merge(
                                const TextStyle(color: AppColors.darkBlue)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0.h, top: 5.w),
                child: Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Phone(s): ',
                            style: AppTextStyles.textBold16.merge(
                                const TextStyle(color: AppColors.darkBlue)),
                          ),
                          TextSpan(
                            text: controller.foundUsers.value[index].phone
                                    .toString() +
                                ' / ',
                            style: AppTextStyles.textRegular14.merge(
                                const TextStyle(color: AppColors.darkBlue)),
                          ),
                          TextSpan(
                            text: controller.foundUsers.value[index].phone
                                .toString(),
                            style: AppTextStyles.textRegular14.merge(
                                const TextStyle(color: AppColors.darkBlue)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.w),
                child: const Divider(),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20.0.h, top: 5.w),
                  child: Row(children: [
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Adress ',
                            style: AppTextStyles.textBold16.merge(TextStyle(
                                fontSize: 20.sp, color: AppColors.darkBlue)),
                          ),
                        ],
                      ),
                    ),
                  ])),
              Padding(
                padding: EdgeInsets.only(left: 20.0.h, top: 5.w),
                child: Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Street: ',
                            style: AppTextStyles.textBold16.merge(
                                const TextStyle(color: AppColors.darkBlue)),
                          ),
                          TextSpan(
                            text: controller.foundUsers.value[index].location!
                                    .street!.name
                                    .toString() +
                                ', ',
                            style: AppTextStyles.textRegular14.merge(
                                const TextStyle(color: AppColors.darkBlue)),
                          ),
                          TextSpan(
                            text: controller.foundUsers.value[index].location!
                                .street!.number
                                .toString(),
                            style: AppTextStyles.textRegular14.merge(
                                const TextStyle(color: AppColors.darkBlue)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0.h, top: 5.w),
                child: Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'City: ',
                            style: AppTextStyles.textBold16.merge(
                                const TextStyle(color: AppColors.darkBlue)),
                          ),
                          TextSpan(
                              text: controller
                                  .foundUsers.value[index].location!.city
                                  .toString(),
                              style: AppTextStyles.textRegular14.merge(
                                  const TextStyle(color: AppColors.darkBlue))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0.h, top: 5.w),
                child: Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'State: ',
                            style: AppTextStyles.textBold16.merge(
                                const TextStyle(color: AppColors.darkBlue)),
                          ),
                          TextSpan(
                              text: controller
                                  .foundUsers.value[index].location!.state
                                  .toString(),
                              style: AppTextStyles.textRegular14.merge(
                                  const TextStyle(color: AppColors.darkBlue))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0.h, top: 5.w),
                child: Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Country: ',
                            style: AppTextStyles.textBold16.merge(
                                const TextStyle(color: AppColors.darkBlue)),
                          ),
                          TextSpan(
                              text: controller
                                  .foundUsers.value[index].location!.country
                                  .toString(),
                              style: AppTextStyles.textRegular14.merge(
                                  const TextStyle(color: AppColors.darkBlue))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
