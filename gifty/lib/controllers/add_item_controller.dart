import 'package:get/get.dart';

class AddItemController extends GetxController {
  final colors = [].obs;
  final tags = {}.obs;
  final productAdded = true.obs;

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

  void doClearColors() {
    colors.clear();
  }

  void doAddInTag(String tagName, String tagValue) {
    print("aaaaaaaa ${tags[tagName] ?? 0}");
    if (tags[tagName] != null) {
      print("bbbbb ${tags[tagName]}");
      tags[tagName].add(tagValue);
    } else {
      tags[tagName] = [tagValue];
    }
    print("cccc ${tags}");
  }

  void doRemoveInTag(String tagName, String tagValue) {
    tags[tagName].remove(tagValue);
    print("cccc2 ${tags}");
  }

  void doClearInTags(String tagName) {
    tags[tagName].clear();
  }

  void doResetTags() {
    tags.clear();
  }

  void doProductAdded_true() {
    productAdded.value = true;
  }

  void doProductAdded_false() {
    productAdded.value = false;
  }
}

final AddItemController controller = AddItemController();
