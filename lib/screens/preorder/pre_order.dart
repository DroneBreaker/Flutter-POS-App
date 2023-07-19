import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_pos_app/config/colors.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:intl/intl.dart';

import '../../config/images.dart';
import '../widgets/buttons.dart';

class PreOrderScreen extends StatefulWidget {
  const PreOrderScreen({super.key});

  @override
  State<PreOrderScreen> createState() => _PreOrderScreenState();
}

class _PreOrderScreenState extends State<PreOrderScreen> {
  bool batch_order = true;

  String current_order_id = "";
  final today = DateUtils.dateOnly(DateTime.now());
  DateTime current_order_date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.BgColor,
      appBar: AppBar(
        backgroundColor: batch_order ? AppColor.PrimaryLightColor : null,
        title: const Text("Order Meal"),
        elevation: 0,
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () async {
                var results = await showCalendarDatePicker2Dialog(
                  context: context,
                  config: CalendarDatePicker2WithActionButtonsConfig(
                      calendarType: CalendarDatePicker2Type.single),
                  dialogSize: const Size(325, 400),
                  borderRadius: BorderRadius.circular(15),
                );
                if (results != null) {
                  current_order_date = DateUtils.dateOnly(results[0]!);
                  setState(() {});
                }
              },
              child: current_order_date != today
                  ? Text('${current_order_date.day}'
                      ' '
                      '${current_order_date.month}')
                  : const Text("Today"))
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(30.h),
            Text(
              "Choose your preferred Dish",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: AppColor.textBlack),
            ),
            Gap(25.h),
            button1("Breakfast", AppImages.breakfast_icon, () {
              Navigator.pushNamed(context, "/dish_period");
            }),
            Gap(15.h),
            button1("Lunch", AppImages.lunch_icon, () {
              Navigator.pushNamed(context, "/dish_period");
            }),
            Gap(15.h),
            button1("Dinner", AppImages.dinner_icon, () {
              // Navigator.pushNamed(context, '/ala_carte_menu');
            }),
            Gap(30.h),
            Expanded(
                child: Container(
              color: AppColor.PrimaryColor,
            )),
            button1("Dinner", AppImages.dinner_icon, () {
              // Navigator.pushNamed(context, '/ala_carte_menu');
            }, false, true)

//Orders

//Submit Order
          ],
        ),
      ),
    );
  }
}
