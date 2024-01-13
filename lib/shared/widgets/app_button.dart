import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';

import '../app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.buttonLabel,
    this.image,
    this.onPressed, this.color, this.shadow, this.buttonLabelStyle,
    this.height,
    this.width,
  });

  final String buttonLabel;
  final TextStyle? buttonLabelStyle;
  final String? image;
  final Color? color;
  final bool? shadow;
  final double? height;
  final double? width;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {

    Widget imageBuilder(String image) {
      if (extension(image) == '.svg') {
        return SvgPicture.asset(
          image
        );
      } else {
        return Image.asset(
          image
        );
      }
    }

    Widget buttonContent(String text, String? image) {
      if(image != null) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            39.horizontalSpace,
            imageBuilder(image),
            38.horizontalSpace,
            Text(
              text,
              style: buttonLabelStyle ?? Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            )
          ],
        );
      } else {
        return Text(
          text,
          style: buttonLabelStyle ?? Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 16
          ),
        );
      }
    }

    return Ink(
      child: InkWell(
        onTap: () {
          return onPressed!();
        },
        child: Container(
            height: height ?? 60,
            width: width ?? double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: color ?? Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: shadow == null ? null : shadow == false ? null : const [
                  BoxShadow(
                    color: AppColors.shadow,
                    offset: Offset(0, 1),
                    blurRadius: 2,
                    spreadRadius: 0,
                  ),
                ]
            ),
            child: buttonContent(buttonLabel, image)
        ),
      ),
    );
  }
}