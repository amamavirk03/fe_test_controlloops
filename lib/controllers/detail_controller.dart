import 'package:get/get.dart';

class DetailController extends GetxController {
  final RxString selectedService = 'Cooking'.obs;
  final RxBool isAboutExpanded = false.obs;

  void selectService(String service) {
    selectedService.value = service;
  }

  void toggleAboutExpanded() {
    isAboutExpanded.value = !isAboutExpanded.value;
  }
}
