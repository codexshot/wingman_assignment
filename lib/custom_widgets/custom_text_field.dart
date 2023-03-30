import 'package:assignment/constants/app_colors.dart';
import 'package:assignment/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  String heading;
  String hint;
  dynamic validators;
  Duration delayDuration = const Duration(milliseconds: 350);
  Duration duration = const Duration(milliseconds: 500);

  CustomTextField(
      {Key? key,
      required this.heading,
      required this.validators,
      required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading, style: AppTextStyles.Header3TextStyle),
        SizedBox(height: 10.w),
        FormBuilderTextField(
            name: heading,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: AppColors.hintColor),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.r),
              ),
              filled: true,
              fillColor: AppColors.fillColor,

            ),


            validator: validators)
      ],
    )
        .animate()
        .fade(delay: delayDuration, duration: duration)
        .slideX(delay: delayDuration);
  }
}
