import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

import '../profile/profile_page.dart';
import '../shared/app_colors.dart';
import '../shared/app_images.dart';
import '../shared/widgets/app_input.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key, required this.name, required this.profilePhoto});
  final String name;
  final String profilePhoto;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    children: [
                      Container(
                        width: 30,
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
              Text(
                name,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                ),
              ).marginOnly(top: 6, bottom: 5),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () => Get.to(() => ProfilePage(name: name, profilePhoto: profilePhoto,)),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle
                      ),
                      child: FadeInImage(
                        placeholder: MemoryImage(kTransparentImage),
                        image: NetworkImage(profilePhoto),
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                          color: AppColors.availableColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.white,
                              width: 2
                          )
                      ),
                    ),
                  )
                ],
              )
            ],
          ).marginOnly(top: 64).marginSymmetric(horizontal: 18),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    46.verticalSpace,
                    Center(
                      child: Text(
                        '08:15',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.grayDark
                        ),
                      ),
                    ).marginOnly(bottom: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.gray
                        ),
                        child: Text(
                          "Hey, hey, hey... It's morning here in Tokyo 😊",
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColor
                          ),
                        ),
                      ),
                    ).marginOnly(right: 82, bottom: 15),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.primary
                        ),
                        child: Text(
                          "Send me some pictures",
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                          ),
                        ),
                      )
                    ).marginOnly(bottom: 15,left: 82),
                    Center(
                      child: Text(
                        '11:40',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.grayDark
                        ),
                      ),
                    ).marginOnly(bottom: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.gray
                        ),
                        child: Text(
                          "Ok... sending",
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColor
                          ),
                        ),
                      ),
                    ).marginOnly(right: 82, bottom: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).primaryColor
                            ),
                            child: Image.asset(
                              AppImages.sentPhoto1,
                            ),
                          ),
                          15.horizontalSpace,
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).primaryColor
                            ),
                            child: Image.asset(
                              AppImages.sentPhoto2,
                            ),
                          )
                        ],
                      ),
                    ).marginOnly(bottom: 15),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.primary
                          ),
                          child: Text(
                            "😱😱😱😱😱 so beautiful",
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                            ),
                          ),
                        )
                    ).marginOnly(bottom: 15,left: 82),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.gray
                        ),
                        child: Text(
                          "You need to see it by yourself. When you come?",
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColor
                          ),
                        ),
                      ),
                    ).marginOnly(right: 82, bottom: 15),
                  ],
                ).marginSymmetric(horizontal: 28),
              )
          ),
          Row(
            children: [
              Expanded(child: AppInput(
                labelText: 'Message',
                readOnly: true,
                suffixIcon: SvgPicture.asset(
                    AppImages.sendMessageIcon,
                  width: 24,
                  height: 24,
                ).marginOnly(right: 15),
                suffixIconConstraints: const BoxConstraints(
                    maxWidth: 40
                ),
              )),
              10.horizontalSpace,
              FloatingActionButton(
                  onPressed: () {

                  },
                backgroundColor: Theme.of(context).primaryColor,
                child: SvgPicture.asset(
                    AppImages.addMoreIcon
                ),
              )
            ],
          ).marginOnly(bottom: 31).marginSymmetric(horizontal: 28)
        ],
      ),
    );
  }

}