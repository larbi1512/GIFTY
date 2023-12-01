import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';

import '../../config/assets.config.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
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
      type: BottomBarEnum.Liked,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
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
                      color: AppColor.bluegrey,
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
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Search,
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
