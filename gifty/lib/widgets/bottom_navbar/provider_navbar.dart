// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gifty/config/colors.config.dart';

import '../../config/assets.config.dart';
import '../../controllers/navbar_controller.dart';

class ProviderBottomNavBar extends StatefulWidget {
  ProviderBottomNavBar({this.onChanged, this.isProvide = false});

  Function(BottomBarEnum)? onChanged;
  bool isProvide = false;

  @override
  _ProviderBottomNavBarState createState() => _ProviderBottomNavBarState();
}

class _ProviderBottomNavBarState extends State<ProviderBottomNavBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: Assets.images.iconHome,
      activeIcon: Assets.images.iconHomeActive,
      title: "Home",
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: Assets.images.iconSearch,
      activeIcon: Assets.images.iconSearchActive,
      title: "Search",
      type: BottomBarEnum.Search,
    ),
    BottomMenuModel(
      icon: Assets.images.iconAdd,
      activeIcon: Assets.images.iconAdd,
      title: "Add",
      type: BottomBarEnum.Add,
      isCircle: true,
    ),
    BottomMenuModel(
      icon: Assets.images.iconHeart,
      activeIcon: Assets.images.iconHeartActive,
      title: "Liked",
      type: BottomBarEnum.Liked,
    ),
    BottomMenuModel(
      icon: Assets.images.iconUser,
      activeIcon: Assets.images.iconUserActive,
      title: "Profile",
      type: BottomBarEnum.Profile,
    )
  ];

  final NavBarController navBarController = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 65,
        // height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Obx(() {
          return BottomNavigationBar(
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 0,
            elevation: 0,
            currentIndex: navBarController.selectedPage.value,
            type: BottomNavigationBarType.fixed,
            items: List.generate(bottomMenuList.length, (index) {
              if (bottomMenuList[index].isCircle) {
                return BottomNavigationBarItem(
                  icon: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: AppColor.mainLighter,
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(bottomMenuList[index].icon),
                          fit: BoxFit.contain,
                        ),
                        color: Colors.transparent,
                      ),
                      margin: EdgeInsets.only(
                          left: 14.5, right: 15.5, top: 15, bottom: 15),
                      // padding: EdgeInsets.all(15),
                      height: 21,
                      width: 21,
                    ),
                  ),
                  activeIcon: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: AppColor.main,
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(bottomMenuList[index].icon),
                          fit: BoxFit.contain,
                        ),
                        color: Colors.transparent,
                      ),
                      margin: EdgeInsets.only(
                          left: 14.5, right: 15.5, top: 15, bottom: 15),
                      // padding: EdgeInsets.all(15),
                      height: 21,
                      width: 21,
                    ),
                  ),
                  label: '',
                );
              }
              return BottomNavigationBarItem(
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(bottomMenuList[index].icon),
                          fit: BoxFit.contain,
                        ),
                        color: Colors.transparent,
                      ),
                      height: 20,
                      width: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                        bottomMenuList[index].title ?? "",
                        style: TextStyle(
                          color: AppColor.bluegrey,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                activeIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(bottomMenuList[index].activeIcon),
                          fit: BoxFit.contain,
                        ),
                        color: Colors.transparent,
                      ),
                      height: 20,
                      width: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7),
                      child: Text(
                        bottomMenuList[index].title ?? "",
                        style: TextStyle(
                          color: AppColor.main,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                label: '',
              );
            }),
            onTap: (index) {
              selectedIndex = index;
              navBarController.SetPage(index);
              widget.onChanged?.call(bottomMenuList[index].type);
              setState(() {});
            },
          );
        }));
  }
}

enum BottomBarEnum {
  Home,
  Search,
  Add,
  Liked,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
    this.isCircle = false,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;

  bool isCircle;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
