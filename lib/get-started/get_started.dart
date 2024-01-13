import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:talky/auth/auth_main_page.dart';

import '../shared/app_colors.dart';
import '../shared/app_images.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStartedPage> {
  int counter = 5;
  late Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(counter > 0) {
        setState(() {
          counter --;
        });
      } else {
        _timer.cancel();
        Navigator.pop(context);
        Get.to(() => const AuthMainPage());
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SvgPicture.asset(
          AppImages.getStartedLogo,
          width: 234,
          height: 97,
        ),
      ),
    );
  }
}