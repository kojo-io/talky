import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';


class AppInput extends StatelessWidget {
  const AppInput({
    super.key,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.readOnly = false,
    this.obscureText = false,
    this.onTap,
    this.controller,
    this.onChanged,
    this.onSaved,
    this.textInputType = TextInputType.text,
    this.expands = false,
    this.maxLength,
    this.maxLines,
    this.minLines = 1,
    this.initialValue
  });

  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly, obscureText;
  final Function()? onTap;
  final BoxConstraints? suffixIconConstraints;
  final TextEditingController? controller;
  final ValueChanged<String?>? onChanged, onSaved;
  final TextInputType textInputType;
  final bool expands;
  final int? maxLength, maxLines;
  final int? minLines;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      onTap: onTap,
      readOnly: readOnly,
      expands: expands,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      minLines: minLines,
      maxLines: maxLines,
      onSaved: onSaved,
      initialValue: initialValue,
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          suffixIconConstraints: suffixIconConstraints ??
              BoxConstraints(
                maxHeight: 40.h,
                maxWidth: 40.w,
              ),
          labelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.inputBorderColor
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.inputBorderColor,
                  style: BorderStyle.solid
              )
          )
      ),
    );
  }
}