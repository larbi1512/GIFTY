import 'package:get/get.dart';

class NavBarController extends GetxController {
  final selectedPage = 0.obs;

  void SetPage(int index) {
    selectedPage.value = index;
  }
}

final NavBarController navBarController = NavBarController();
