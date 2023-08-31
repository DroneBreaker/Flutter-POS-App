import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_pos_app/config/colors.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:restaurant_pos_app/config/keywords.dart';
import 'package:restaurant_pos_app/screens/preorder/food_list.dart';
import 'package:restaurant_pos_app/screens/success.dart';
import '../../config/images.dart';
import '../../models/order.dart';
import '../../providers/order_provider.dart';
import '../../utils/local_db.dart';
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
  final tomorrow =
      DateUtils.dateOnly(DateTime.now().add(const Duration(days: 1)));
  // ignore: non_constant_identifier_names
  DateTime current_order_date =
      DateUtils.dateOnly(DateTime.now().add(const Duration(days: 1)));
  final DatabaseProvider _databaseProvider = DatabaseProvider();

  @override
  void initState() {
    // TODO: implement initState

    _databaseProvider.initDB();

    super.initState();
  }

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
                        currentDate: current_order_date,
                        calendarType: CalendarDatePicker2Type.single),
                    dialogSize: Size(325.w, 400.h),
                    borderRadius: BorderRadius.circular(15),
                  );
                  // ignore: unrelated_type_equality_checks
                  try {
                    setState(() {
                      current_order_date = DateUtils.dateOnly(results![0]!);
                    });
                  } catch (e) {
                    print(e);
                  }
                },
                child: current_order_date == today
                    ? const Text(
                        "Today",
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      )
                    : current_order_date == tomorrow
                        ? const Text(
                            "Tomorrow",
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          )
                        : Text(
                            '${current_order_date.day}'
                            ' '
                            '${current_order_date.month}',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0))))
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
                Gap(60.h),
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
                        // FUNCTION GOES HERE TO VALIDATE BEFORE MOVING TO THE SUCCESS PAGE

                        // Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (context) {
                        // FoodMenuScreen(
                        //     date: current_order_date,
                        //     category: AppKeywords.breakFastSelected),
                        Order g = Order(
                            id: "3434",
                            date:
                                current_order_date.toString().substring(0, 10),
                            orders: [
                              Orders(
                                  type: AppKeywords.breakFastSelected,
                                  id: "77675")
                            ]);
                        Provider.of<OrderProvider>(context, listen: false)
                            .addOrder(order: g);
                        // Navigator.pop(context);
                        setState(() {});
                      })
                    : Container(),
                Gap(15.h),
                button1("Lunch", AppImages.lunch_icon, () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                    builder: (context) => FoodMenuScreen(
                        date: current_order_date,
                        category: AppKeywords.lunchSelected),
                  ))
                      .then((value) {
                    setState(() {});
                  });
                }),
                Gap(15.h),
                button1("Dinner", AppImages.dinner_icon, () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                    builder: (context) => FoodMenuScreen(
                        date: current_order_date,
                        category: AppKeywords.dinnerSelected),
                  ))
                      .then((value) {
                    setState(() {});
                  });
                  // Navigator.pushNamed(context, '/ala_carte_menu');
                }),
                // Gap(40.h),

                Gap(40.h),
                Expanded(
                  child: Container(
                    // color: const Color.fromARGB(58, 0, 0, 0),
                    padding: EdgeInsets.only(top: 15.h),
                    width: 269.w,
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: Provider.of<OrderProvider>(context)
                            .loadOrder()
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          Order item = Provider.of<OrderProvider>(context)
                              .loadOrder()[index];
                          return Container(
                            margin: EdgeInsets.only(top: 10.h),
                            height: 60.h,
                            decoration: BoxDecoration(
                                color: AppColor.white.withOpacity(.6),
                                borderRadius: BorderRadius.circular(40)),
                            child: Row(
                              children: [
                                Gap(20.w),
                                Expanded(
                                    child: Row(
                                  children: [
                                    today ==
                                            DateTime.parse(item.date.toString())
                                        ? const Text("Today")
                                        : tomorrow ==
                                                DateTime.parse(
                                                    item.date.toString())
                                            ? const Text("Tomorrow")
                                            : Text(item.date.toString()),
                                    const Gap(20),
                                    ...item.orders!.map((element) {
                                      if (element.type.toString() ==
                                          AppKeywords.breakFastSelected) {
                                        return Container(
                                          padding: const EdgeInsets.all(2),
                                          margin: const EdgeInsets.all(2),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                              AppImages.breakfast_icon,
                                              width: 36.w,
                                              height: 38.h,
                                            ),
                                          ),
                                        );
                                      } else if (element.type.toString() ==
                                          AppKeywords.lunchSelected) {
                                        return Container(
                                          padding: const EdgeInsets.all(2),
                                          margin: const EdgeInsets.all(2),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                              AppImages.lunch_icon,
                                              width: 36.w,
                                              height: 38.h,
                                            ),
                                          ),
                                        );
                                      } else if (element.type.toString() ==
                                          AppKeywords.dinnerSelected) {
                                        return Container(
                                          padding: const EdgeInsets.all(2),
                                          margin: const EdgeInsets.all(2),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                              AppImages.dinner_icon,
                                              width: 36.w,
                                              height: 38.h,
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    }),
                                  ],
                                )),
                                IconButton(
                                    onPressed: () {
                                      Provider.of<OrderProvider>(context,
                                              listen: false)
                                          .removeOrder(
                                              date: item.date.toString());
                                      setState(() {});
                                    },
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

                Provider.of<OrderProvider>(context, listen: true)
                        .loadOrder()
                        .isEmpty
                    ? Container()
                    : button1("Submit", AppImages.dinner_icon, () {
                        Provider.of<OrderProvider>(context, listen: false)
                            .loadOrder()
                            .forEach((o) {
                          _databaseProvider.insertData({
                            "staff_id": "2",
                            "department_id": "2",
                            "order_id": "ORDER${today.toString().trim()}",
                            "order_data":
                                jsonEncode(o.toJson()["orders"]).toString(),
                            "order_for_date":
                                o.date.toString().substring(0, 10),
                            "order_datetime": today.toString().substring(0, 10)
                          });
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SuccessPage(),
                          ));
                        });
                      }, false, true)

//Orders

//Submit Order
              ],
            ),
          ),
        ]));
  }
}
