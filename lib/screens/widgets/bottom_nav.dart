import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_pos_app/config/colors.dart';
import 'package:restaurant_pos_app/providers/app_provider.dart';

SizedBox bottomNav(context) {
  return SizedBox(
    height: 104.h,
    child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/images/nav_home.png"),
              size: 30.h,
              color: AppColor.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/images/nav_search.png"),
              size: 30.h,
              color: AppColor.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/images/nav_grid.png"),
              size: 30.h,
              color: AppColor.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/images/nav_menu.png"),
              size: 30.h,
              color: AppColor.black,
            ),
            label: '',
          ),
        ],
        onTap: (int index) {
          Provider.of<AppProvider>(context, listen: false)
              .setHomePageIndex(homepageIndex: index);
        }),
  );
}
