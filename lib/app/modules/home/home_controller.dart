import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pharma/app/data/model/user/user_model.dart';
import 'package:pharma/app/data/repository/i_random_user_repository.dart';

class HomePageController extends GetxController {
  final IRandomUserRepository randomUserRepository;

  HomePageController({required this.randomUserRepository});
  Rx<List<UserModel>> foundUsers = Rx<List<UserModel>>([]);
  Rx<List<UserModel>> users = Rx<List<UserModel>>([]);
  RxString dropdownValue = 'All'.obs;
  TextEditingController txtSearch = TextEditingController();
  Future<List<UserModel>> getUsers(String qtd) async {
    var result = await randomUserRepository.getListUsers(qtd);
    for (var i in result) {
      users.value.add(i);
    }
    foundUsers.value = users.value;
    return users.value;
  }

  String getFormattedDate(String date) {
    var localDate = DateTime.parse(date).toLocal();
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(localDate.toString());

    var outputFormat = DateFormat('dd/MM/yyyy');
    var outputDate = outputFormat.format(inputDate);

    return outputDate.toString();
  }

  void filterPlayer() {
    foundUsers.value = [];
    List<UserModel> results = [];
    if (txtSearch.text.isEmpty) {
      results = users.value;
      if (dropdownValue.value != 'All') {
        results = users.value
            .where((element) => element.gender!
                .toString()
                .toLowerCase()
                .startsWith(dropdownValue.value.toLowerCase().toLowerCase()))
            .toList();
      }
    } else {
      if (dropdownValue.value == 'All') {
        results = users.value
            .where((element) =>
                element.name!.first
                    .toString()
                    .toLowerCase()
                    .startsWith(txtSearch.text.toLowerCase()) ||
                element.location!.country
                    .toString()
                    .toLowerCase()
                    .startsWith(txtSearch.text.toLowerCase()))
            .toList();
      } else {
        results = users.value
            .where((element) =>
                (element.name!.first
                        .toString()
                        .toLowerCase()
                        .startsWith(txtSearch.text.toLowerCase()) ||
                    element.location!.country
                        .toString()
                        .toLowerCase()
                        .startsWith(txtSearch.text.toLowerCase())) &&
                element.gender!.toString().toLowerCase().startsWith(
                    dropdownValue.value.toLowerCase().toLowerCase()))
            .toList();
      }
    }
    for (var i in results) {
      foundUsers.value.add(i);
    }
  }

  void filterPlayerByGender() {
    foundUsers.value = [];
    List<UserModel> results = [];
    if (dropdownValue.value == 'All') {
      results = users.value;
      if (txtSearch.text.isNotEmpty) {
        results = users.value
            .where((element) =>
                element.name!.first
                    .toString()
                    .toLowerCase()
                    .startsWith(txtSearch.text.toLowerCase()) ||
                element.location!.country
                    .toString()
                    .toLowerCase()
                    .startsWith(txtSearch.text.toLowerCase()))
            .toList();
      }
    } else {
      if (txtSearch.text.isEmpty) {
        results = users.value
            .where((element) => element.gender!
                .toString()
                .toLowerCase()
                .startsWith(dropdownValue.value.toLowerCase().toLowerCase()))
            .toList();
      } else {
        results = users.value
            .where((element) =>
                (element.name!.first
                        .toString()
                        .toLowerCase()
                        .startsWith(txtSearch.text.toLowerCase()) ||
                    element.location!.country
                        .toString()
                        .toLowerCase()
                        .startsWith(txtSearch.text.toLowerCase())) &&
                element.gender!.toString().toLowerCase().startsWith(
                    dropdownValue.value.toLowerCase().toLowerCase()))
            .toList();
      }
    }
    for (var i in results) {
      foundUsers.value.add(i);
    }
  }

  Future<void> loadValues() async {
    dropdownValue.value = 'All';
    txtSearch.clear();
    getUsers('5');

    filterPlayer();

    await 2.delay();
    Get.back();
    // ignore: avoid_print
    print(foundUsers.value.length);
  }
}
