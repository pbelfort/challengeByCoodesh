import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pharma/app/modules/home/home_controller.dart';
import 'package:pharma/app/modules/home/widgets/user_information_widget.dart';
import 'package:pharma/app/modules/widgets/text_form_fields/custom_text_form_field.dart';
import 'package:pharma/app/theme/app_colors.dart';
import 'package:pharma/app/theme/app_text_styles.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: AppColors.green,
        centerTitle: true,
        title: const Text('Pharma Users'),
      ),
      body: FutureBuilder(
        future: controller.getUsers('5'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Scaffold(
              body: SafeArea(
                child: Container(
                  color: AppColors.white,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.green,
                    ),
                  ),
                ),
              ),
            );
          } else {
            return SafeArea(
              child: Container(
                color: AppColors.white,
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverFillRemaining(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: CustomTextFormField(
                                    changeAccount: null,
                                    keyboardType: TextInputType.name,
                                    borderColor: AppColors.mediumGray,
                                    textInputAction: TextInputAction.next,
                                    fillColor: AppColors.white,
                                    textInputEnable: true,
                                    textInputUsernameVisible: false,
                                    textInputPasswordVisible: false,
                                    labelText: "Search",
                                    textEditingController: controller.txtSearch,
                                    onChanged: (value) {
                                      controller.filterPlayer();
                                    },
                                    validator: (value) {},
                                  ),
                                ),
                                const Expanded(
                                    child: Icon(
                                  Icons.search,
                                  color: AppColors.lightBlue,
                                  size: 50,
                                ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    'Filter by gender',
                                    style: AppTextStyles.textRegular16.merge(
                                        const TextStyle(
                                            color: AppColors.lightBlue)),
                                  ),
                                ),
                                Obx(
                                  () => DropdownButton<String>(
                                    value: controller.dropdownValue.value,
                                    icon: const Icon(
                                      Icons.arrow_downward,
                                      color: AppColors.lightBlue,
                                    ),
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: AppColors.lightBlue),
                                    underline: Container(
                                      height: 2,
                                      color: AppColors.orange,
                                    ),
                                    onChanged: (String? newValue) {
                                      controller.dropdownValue.value =
                                          newValue!;
                                      controller.filterPlayerByGender();
                                      print(controller.dropdownValue.value);
                                    },
                                    items: <String>['All', 'Male', 'Female']
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Expanded(
                            child: Obx(
                              () => ListView.builder(
                                itemCount: controller.foundUsers.value.length,
                                itemBuilder: (context, index) => Card(
                                  child: InkWell(
                                    splashColor: Colors.blue.withAlpha(30),
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) =>
                                              UserInformationWidgert(
                                                index: index,
                                              ));
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            radius: 40.0,
                                            backgroundImage: NetworkImage(
                                                controller
                                                    .foundUsers
                                                    .value[index]
                                                    .picture!
                                                    .medium
                                                    .toString()),
                                            backgroundColor: Colors.transparent,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text.rich(
                                              TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: controller
                                                            .foundUsers
                                                            .value[index]
                                                            .name!
                                                            .first
                                                            .toString() +
                                                        ' ' +
                                                        controller
                                                            .foundUsers
                                                            .value[index]
                                                            .name!
                                                            .last
                                                            .toString(),
                                                    style: AppTextStyles
                                                        .textBold16
                                                        .merge(const TextStyle(
                                                            color: AppColors
                                                                .darkBlue)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: controller
                                                        .foundUsers
                                                        .value[index]
                                                        .location!
                                                        .country!
                                                        .toString(),
                                                    style: AppTextStyles
                                                        .textBold14
                                                        .merge(const TextStyle(
                                                            color: AppColors
                                                                .darkBlue)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  controller.foundUsers
                                                      .value[index].dob!.age
                                                      .toString(),
                                                  style: AppTextStyles
                                                      .textBold14
                                                      .merge(const TextStyle(
                                                          color: AppColors
                                                              .darkBlue)),
                                                ),
                                                SizedBox(
                                                  width: 5.h,
                                                ),
                                                Text(
                                                  'Years old',
                                                  style: AppTextStyles
                                                      .textRegular14
                                                      .merge(const TextStyle(
                                                          color: AppColors
                                                              .darkBlue)),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  controller.foundUsers
                                                      .value[index].gender
                                                      .toString()
                                                      .capitalize!,
                                                  style: AppTextStyles
                                                      .textRegular14
                                                      .merge(const TextStyle(
                                                          color: AppColors
                                                              .darkBlue)),
                                                ),
                                                SizedBox(
                                                  width: 130.h,
                                                ),
                                                Text(
                                                  controller.getFormattedDate(
                                                    controller.foundUsers
                                                        .value[index].dob!.date
                                                        .toString(),
                                                  ),
                                                  style: AppTextStyles
                                                      .textRegular14
                                                      .merge(const TextStyle(
                                                          color: AppColors
                                                              .darkBlue)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      child: CircularProgressIndicator(
                                        color: AppColors.green,
                                      ));
                                },
                              );
                              controller.loadValues();
                            },
                            child: Container(
                              color: AppColors.green,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Icon(
                                      Icons.refresh_rounded,
                                      size: 50.h,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      'Loading more...',
                                      style: AppTextStyles.textRegular16.merge(
                                          const TextStyle(
                                              color: AppColors.white)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
