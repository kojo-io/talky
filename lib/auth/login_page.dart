import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:talky/home/home_page.dart';

import '../shared/app_colors.dart';
import '../shared/app_images.dart';
import '../shared/widgets/app_button.dart';
import '../shared/widgets/app_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.loginProvider});
  final String loginProvider;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary.withOpacity(0.2)
                    ),
                    child: const Icon(
                        Icons.arrow_back_rounded,
                        size: 24,
                        color: AppColors.primary
                    ),
                  ),
                ),
                8.horizontalSpace,
                Text(
                  'Back',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor
                  ),
                )
              ],
            ).paddingOnly(top: 64, left: 18, bottom: 21),
            Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 48,
                        child: SvgPicture.asset(
                          AppImages.secondaryLogo,
                          width: 117,
                          height: 48,
                        ),
                      ).paddingOnly(bottom: 40),
                      Container(
                        alignment: Alignment.center,
                        height: 48,
                        child: Text(
                          'Sign in with $loginProvider',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                          ),
                        ),
                      ).paddingOnly(bottom: 40),
                      const AppInput(
                          labelText: 'Enter your mail address'
                      ).paddingOnly(bottom: 18),
                      AppInput(
                        labelText: 'Enter your password',
                        suffixIcon: const Icon(
                          Icons.visibility_rounded,
                          color: AppColors.inputBorderColor,
                        ).marginOnly(right: 15),
                      ).paddingOnly(bottom: 18),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Forgot password?',
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              decoration: TextDecoration.underline,
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ).paddingOnly(left: 20, bottom: 163),
                      AppButton(
                        buttonLabel: 'Sign In',
                        buttonLabelStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white
                        ),
                        onPressed: () => Get.to(() => const HomePage()),
                        color: AppColors.primary,
                      ).paddingOnly(bottom: 30),
                      Center(
                        child: Text(
                          'Already have an account?',
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                        ).paddingOnly(bottom: 5),
                      ),
                      Center(
                        child: Text(
                          'Sign up here',
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary
                          ),
                        ),
                      )
                    ],
                  ).paddingSymmetric(horizontal: 28),
                )
            )
          ],
        ),
      ),
    );
  }
}