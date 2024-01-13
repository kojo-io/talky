import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:talky/auth/login_page.dart';

import '../shared/app_colors.dart';
import '../shared/app_images.dart';
import '../shared/widgets/app_button.dart';

class AuthMainPage extends StatelessWidget {
  const AuthMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            71.verticalSpace,
            Container(
              alignment: Alignment.center,
              height: 73,
              child: SvgPicture.asset(
                AppImages.secondaryLogo,
                width: 375,
                height: 73,
              ),
            ),
            78.verticalSpace,
            AppButton(
              buttonLabel: 'Sign in with Google',
              image: AppImages.google,
              shadow: true,
              onPressed: () => Get.to(() => const LoginPage(loginProvider: 'Google')),
            ),
            16.verticalSpace,
            AppButton(
              buttonLabel: 'Sign in with Facebook',
              image: AppImages.facebook,
              shadow: true,
              onPressed: () => Get.to(() => const LoginPage(loginProvider: 'Facebook')),
            ),
            16.verticalSpace,
            AppButton(
              buttonLabel: 'Sign in with Apple',
              image: AppImages.apple,
              shadow: true,
              onPressed: () => Get.to(() => const LoginPage(loginProvider: 'Apple')),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 100,
                  child: Divider(
                    thickness: 1,
                    color: AppColors.dividerColor,
                  ),
                ),
                20.horizontalSpace,
                Text(
                  'or',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),
                20.horizontalSpace,
                const SizedBox(
                  width: 100,
                  child: Divider(
                    thickness: 1,
                    color: AppColors.dividerColor,
                  ),
                )
              ],
            ).paddingSymmetric(horizontal: 32, vertical: 30),
            AppButton(
              buttonLabel: 'Continue with phone number',
              onPressed: () {},
              shadow: true,
            ).paddingOnly(bottom: 56),
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
      ),
    );
  }
}