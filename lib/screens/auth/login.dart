import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_pos_app/config/colors.dart';
import 'package:restaurant_pos_app/config/images.dart';
import 'package:restaurant_pos_app/screens/widgets/bg.dart';
import 'package:restaurant_pos_app/screens/widgets/buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late double staffID;
  String password = '';

  final TextEditingController staffIDController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _submitLogin() {
    if (_formKey.currentState!.validate()) {
      // print(_username);
      // Form is valid, perform login logic
      // You can replace this with your own login implementation

      if (staffIDController.text == '4677' &&
          passwordController.text == 'password') {
        // Login successful, navigate to preorder screen or main part of the app
        Navigator.pushReplacementNamed(context, '/preorder');
      } else {
        // Login failed, display an error message
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Login Failed'),
              content: const Text('Incorrect username or password.'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
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
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(top: 149.h - 54.h),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(children: [
                  Gap(30.h),
                  Form(
                    key: _formKey,
                    child: Column(children: [
                      Gap(40.h),
                      Text(
                        'Login Here',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 25.sp,
                            color: AppColor.white),
                      ),
                      Gap(20.h),
                      TextFormField(
                        controller: staffIDController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your staff ID';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          staffID = value! as double;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.only(left: 20),
                            hintText: 'Staff ID',
                            hintStyle: TextStyle(color: AppColor.white)),
                      ),
                      Gap(35.h),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          password = value!;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.only(left: 20),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: AppColor.white)),
                      ),
                      Gap(30.h),
                      button1(
                          'Login', AppImages.add, _submitLogin, false, true),
                    ]),
                  ),
                ]),
              ),
            ),
          )
        ]));
  }
}
