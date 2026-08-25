import 'package:get/get.dart';

class CategoryController extends GetxController {
  final RxString searchQuery = ''.obs;
  final Rx<double?> minRating = Rx<double?>(null);
  final RxBool sortByPrice = false.obs;

  void setSearchQuery(String query) {
    searchQuery.value = query;
  }

  void filterTopRated() {
    minRating.value = 4.7;
    sortByPrice.value = false;
  }

  void filterPriceLowToHigh() {
    sortByPrice.value = true;
    minRating.value = null;
  }

  void resetFilters() {
    searchQuery.value = '';
    minRating.value = null;
    sortByPrice.value = false;
  }
}
