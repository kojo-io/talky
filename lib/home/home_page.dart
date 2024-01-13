import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:talky/chat/chart_page.dart';
import 'package:talky/profile/profile_page.dart';
import 'package:transparent_image/transparent_image.dart';

import '../shared/app_colors.dart';
import '../shared/app_images.dart';
import '../shared/model/dummy_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String timeAgo(DateTime dateTime) {
    final Duration difference = DateTime.now().difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}min ago';
    } else {
      return 'just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () => Get.to(() => const ProfilePage(name: 'Gia O.A', profilePhoto: AppImages.profilePhoto,)),
                    child: Container(
                      height: 50,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle
                      ),
                      child: Image.network(
                        AppImages.profilePhoto,
                        width: 50,
                        height: 50,
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
              ),
              const Icon(
                Icons.search_rounded,
                size: 26,
              )
            ],
          ).paddingOnly(top: 54, left: 30, right: 28, bottom: 24),
          Container(
            height: 52,
            width: double.infinity,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: AppColors.tabBgColor,
                borderRadius: BorderRadius.circular(8)
            ),
            child: LayoutBuilder(
              builder: (context, constraint) {
                double containerWidth = constraint.maxWidth;
                double width = containerWidth / 2;
                return  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.20),
                              offset: Offset(0, 4),
                              blurRadius: 8,
                              spreadRadius: 0,
                            )
                          ]
                      ),
                      child: Text(
                        'Chat',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: width,
                      alignment: Alignment.center,
                      child: Text(
                        'Call',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.inputBorderColor
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ).paddingSymmetric(horizontal: 24),
          Expanded(
            child: ListView.separated(
                itemCount: userChats.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Ink(
                  child: InkWell(
                    onTap: () => Get.to(() => ChartPage(name: userChats[index].name, profilePhoto: userChats[index].profilePhoto)),
                    child: Container(
                      height: 70,
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          28.horizontalSpace,
                          userChats[index].isGroup == false ?
                          Container(
                            height: 50,
                            width: 50,
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle
                            ),
                            child: FadeInImage(
                              placeholder: MemoryImage(kTransparentImage),
                              image: NetworkImage(userChats[index].profilePhoto),
                              fit: BoxFit.cover,
                            ),
                          ) :
                          Stack(
                            children: [
                              const SizedBox(
                                width: 50,
                                height: 50,
                              ),
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                    height: 32,
                                    width: 32,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle
                                    ),
                                    child: FadeInImage(
                                      placeholder: MemoryImage(kTransparentImage),
                                      image: NetworkImage(userChats[index].profilePhoto),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 32,
                                    width: 32,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle
                                    ),
                                    child: FadeInImage(
                                      placeholder: MemoryImage(kTransparentImage),
                                      image: NetworkImage(userChats[index].profilePhoto1!),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                              )
                            ],
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      userChats[index].name,
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16
                                      ),
                                    ),
                                    Text(
                                      timeAgo(userChats[index].lastSeen),
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12
                                      ),
                                    ),
                                  ],
                                ).paddingOnly(top: 10, bottom: 3),
                                Text(
                                    userChats[index].lastMessage
                                )
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                            AppImages.chevronIcon,
                            width: 24,
                            height: 24,
                          ),
                          18.horizontalSpace
                        ],
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                  color: AppColors.gray,
                )
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () => {},
        backgroundColor: Theme.of(context).primaryColor,
        child: SvgPicture.asset(
          AppImages.floatingMenu
        ),
      ),
    );
  }
}