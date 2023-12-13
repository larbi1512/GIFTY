import 'package:get/get.dart';

class AddItemController extends GetxController {
  final colors = [].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void doAddColor(String color) {
    colors.add(color);
  }

  void doRemoveColor(String color) {
    colors.remove(color);
  }
}

final AddItemController controller = AddItemController();
