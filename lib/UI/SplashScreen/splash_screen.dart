// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:macos2/UI/HomePage.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/ColorConstant.dart';
import '../../constant/imageCOnstant.dart';
import '../../constant/service_locator.dart';
import '../../network/apiService.dart';
import '../../network/endpoint.dart';
import '../../persistance/preferences.dart';
import '../../persistance/shared_preference_helper.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key, required this.color});

  Color color;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    firstLogin();
    logger.i("SplashScreen.....");
    getDeviceId();
    navigate();
  }

  String? getToken;

  getDeviceId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      getToken = sharedPreferences.getString(Preferences.userId);
    });
    logg();
  }

  logg() {
    log("log (){}");
    if (getToken == null) {
      // apiServices.login(context, true);
    } else {
      log("getToken no null");
    }
  }

  firstLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(Preferences.logInFirstTime, true);
  }

  navigate() async {
    Future.delayed(
      Duration(seconds: 3),
      () async {
        // if (await islogin()) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
        // } else {
        //   Navigator.pushAndRemoveUntil(
        //       context,
        //       MaterialPageRoute(builder: (_) => LoginScreen()),
        // (route) => false);
        // }
      },
    );
  }

  Future<bool> islogin() async {
    return SharedPreferences.getInstance().then((val) {
      return getIt<SharedPreferenceHelper>().isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // backgroundColor: ColorConstant.bgColor,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: widget.color,
          ),
          child: FlutterLogo(
            size: 100,
          ),
        ),
      ),
    );
  }
}
