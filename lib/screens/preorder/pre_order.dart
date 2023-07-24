import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_pos_app/config/colors.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import '../../config/images.dart';
import '../widgets/bg.dart';
import '../widgets/buttons.dart';

class PreOrderScreen extends StatefulWidget {
  const PreOrderScreen({super.key});

  @override
  State<PreOrderScreen> createState() => _PreOrderScreenState();
}

class _PreOrderScreenState extends State<PreOrderScreen> {
  // ignore: non_constant_identifier_names
  bool batch_order = true;
  // ignore: non_constant_identifier_names
  String current_order_id = "";
  final today = DateUtils.dateOnly(DateTime.now());
  // ignore: non_constant_identifier_names
  DateTime current_order_date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.PrimaryColor,
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
                    dialogSize: Size(325.w, 400.h),
                    borderRadius: BorderRadius.circular(15),
                  );
                  if (results != null) {
                    setState(() {
                      current_order_date = DateUtils.dateOnly(results[0]!);
                    });
                  }
                },
                child: current_order_date != today
                    ? Text('${current_order_date.day}'
                        ' '
                        '${current_order_date.month}')
                    : const Text(
                        "Today",
                        style: TextStyle(color: AppColor.textBlack),
                      ))
          ],
        ),
        body: Stack(children: [
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
          SizedBox(
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
                      color: AppColor.white),
                ),
                Gap(25.h),
                batch_order
                    ? button1("Breakfast", AppImages.breakfast_icon, () {
                        Navigator.pushNamed(context, "/test_food",
                            arguments: {"Date": current_order_date});
                      })
                    : Container(),
                Gap(15.h),
                button1("Lunch", AppImages.lunch_icon, () {
                  Navigator.pushNamed(context, "/dish_period");
                }),
                Gap(15.h),
                button1("Dinner", AppImages.dinner_icon, () {
                  // Navigator.pushNamed(context, '/ala_carte_menu');
                }),
                Gap(40.h),
                SizedBox(
                    child: Text(
                  "Orders",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: AppColor.white),
                )),
                Gap(40.h),
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(58, 0, 0, 0),
                    padding: EdgeInsets.only(top: 15.h),
                    // width: 350.w,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: 10.w,
                                right: 10.w,
                                bottom: 10.h,
                                top: 5.h),
                            height: 80.h,
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              children: [
                                Gap(20.w),
                                const Expanded(
                                    child: Text("Order for \n 2nd July, 2023")),
                                IconButton(
                                    onPressed: () {},
                                    icon: FaIcon(
                                      FontAwesomeIcons.trash,
                                      size: 20.h,
                                    )),
                                Gap(10.w),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                button1("Submit", AppImages.dinner_icon, () {
                  // Navigator.pushNamed(context, '/ala_carte_menu');
                }, false, true)

//Orders

//Submit Order
              ],
            ),
          ),
        ]));
  }
}
