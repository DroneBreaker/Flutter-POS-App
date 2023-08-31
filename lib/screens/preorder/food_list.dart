import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_pos_app/config/images.dart';
import 'package:restaurant_pos_app/config/keywords.dart';

import '../../config/colors.dart';
// import 'widgets/bottom_nav.dart';
import '../../models/order.dart';
import '../../providers/order_provider.dart';
import '../widgets/buttons.dart';
import '../widgets/food_widget.dart';

// ignore: must_be_immutable
class FoodMenuScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var date;
  final String category;
  FoodMenuScreen({super.key, required this.date, required this.category});

  @override
  State<FoodMenuScreen> createState() => _FoodMenuScreenState();
}

class _FoodMenuScreenState extends State<FoodMenuScreen> {
  @override
  void initState() {
    // print(widget.date["Date"]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      extendBodyBehindAppBar: true,
      body: Container(
        color: AppColor.BgColor,
        padding: EdgeInsets.only(top: 91.h),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.breakfast_icon,
                  width: 36.w,
                  height: 38.h,
                  fit: BoxFit.cover,
                ),
                Gap(10.w),
                Text(
                  "Food Menu",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      color: AppColor.black),
                ),
              ],
            ),
            Gap(20.h),
            Image.asset(
              AppImages.header_image_breakfast,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Gap(30.h),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return FoodWidget1(
                          "Food Wrap",
                          "2 Eggs, Sausage Slices, Baked Beans small portion fries Served with Tea",
                          AppImages.breakfast_image,
                          index,
                          widget.category, () {
                        Provider.of<OrderProvider>(context, listen: false)
                            .setSelectedFood(
                                setSelectedFood: index,
                                category: widget.category);
                        setState(() {});
                      });
                    }),
              ),
            ),
            button1("Done", AppImages.dinner_icon, () {
              Order g = Order(
                  id: "3434",
                  date: widget.date.toString().substring(0, 10),
                  orders: [Orders(type: widget.category, id: "77675")]);
              Provider.of<OrderProvider>(context, listen: false)
                  .addOrder(order: g);
              Navigator.pop(context);
              setState(() {});
            }, false, true)
          ],
        ),
      ),
    );
  }
}
