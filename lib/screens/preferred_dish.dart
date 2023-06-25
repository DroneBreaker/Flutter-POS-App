import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_pos_app/config/colors.dart';
import 'package:restaurant_pos_app/screens/widgets/bg.dart';

class PrefDishScreen extends StatelessWidget {
  const PrefDishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: BgD(),
            child: Container(
              width: double.infinity,
              height: 705.h,
              color: AppColor.PrimaryLightColor,
            ),
          ),
          ClipPath(
            clipper: BgD(),
            child: Container(
              width: double.infinity,
              height: 651.h,
              color: AppColor.PrimaryColor,
            ),
          ),

          // Body of the page
          SafeArea(
              child: Container(
                  padding: EdgeInsets.only(top: 259.h - 54.h),
                  width: double.infinity,
                  child: Column(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 40,
                        color: AppColor.white,
                      ),
                      const Text('Choose Your Preferred Dish'),
                      const SizedBox(
                        height: 60,
                      ),

                      //Buttons
                      ElevatedButton(
                          onPressed: () {
                            return;
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.room_service),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Local Dishes')
                            ],
                          )),
                      ElevatedButton(
                          onPressed: () {
                            return;
                          },
                          // style: ButtonStyle(backgroundColor: AppColor.white),
                          child: const Row(
                            children: [
                              Icon(Icons.local_dining),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Continental Dishes',
                              )
                            ],
                          )),
                    ],
                  )))
        ],
      ),
    );
  }
}
