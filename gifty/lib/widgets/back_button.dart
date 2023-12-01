import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';

class GoBackButton extends StatelessWidget {
  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  const GoBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => goBack(context),
      mini: true,
      elevation: 0,
      backgroundColor: AppColor.mainLighter,
      shape: CircleBorder(),
      child: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    );
  }
}
