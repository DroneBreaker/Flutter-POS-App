import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_pos_app/config/colors.dart';

class ReceivedOrderScreen extends StatefulWidget {
  const ReceivedOrderScreen({super.key});

  @override
  State<ReceivedOrderScreen> createState() => _ReceivedOrderScreenState();
}

class _ReceivedOrderScreenState extends State<ReceivedOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Received Order Page',
        style: GoogleFonts.inter(color: AppColor.PrimaryColor, fontSize: 20.sp),
      )),
    );
  }
}
