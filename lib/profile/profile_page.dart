import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

import '../shared/app_colors.dart';
import '../shared/app_images.dart';
import '../shared/widgets/app_button.dart';
import '../shared/widgets/app_input.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.name, required this.profilePhoto});
  final String name;
  final String profilePhoto;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Profile',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ).marginOnly(top: 6, bottom: 5),
              Positioned(
                  child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Row(
                        children: [
                          Container(
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
                      )
                  ),
              )
            ],
          ).paddingOnly(top: 64, left: 18),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    48.verticalSpace,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Container(
                            width: 190,
                            height: 190,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle
                            ),
                            child: FadeInImage(
                              placeholder: MemoryImage(kTransparentImage),
                              image: NetworkImage(profilePhoto),
                              fit: BoxFit.cover,
                              height: 190,
                              width: 190,
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 15,
                              child: Container(
                                width: 50,
                                height: 50,
                                padding: const EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).primaryColor
                                ),
                                child: SvgPicture.asset(
                                  AppImages.editIcon,
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                    50.verticalSpace,
                    AppInput(
                      labelText: 'Enter your full name',
                      initialValue: name,
                    ).paddingOnly(bottom: 18),
                    const AppInput(
                      labelText: 'Enter your status',
                      initialValue: 'At the gym',
                    ).paddingOnly(bottom: 18),
                    AppInput(
                      labelText: 'Available',
                      initialValue: 'Available',
                      readOnly: true,
                      prefixIcon: Container(
                        width: 18,
                        height: 18,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.availableColor
                        ),
                      ).marginOnly(left: 18, top: 18, bottom: 18, right: 12),
                      suffixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 44,
                            child: VerticalDivider(
                              width: 1,
                              color: AppColors.grayDark,
                            ),
                          ),
                          SvgPicture.asset(
                              AppImages.dropdownIcon
                          ).marginAll(15)
                        ],
                      ),
                      suffixIconConstraints: const BoxConstraints(
                        maxWidth: 90
                      ),
                    ).paddingOnly(bottom: 18),
                    91.verticalSpace,
                    AppButton(
                      buttonLabel: 'Complete',
                      buttonLabelStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.white
                      ),
                      onPressed: () => Get.back(),
                      color: AppColors.primary,
                    ).marginOnly(bottom: 90),
                  ],
                ).marginSymmetric(horizontal: 28),
              )
          )
        ],
      ),
    );
  }

}