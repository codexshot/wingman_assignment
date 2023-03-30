import 'package:assignment/constants/app_colors.dart';
import 'package:assignment/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../generated/assets.dart';

class CustomButtonAnimatedWidget extends StatelessWidget {
  late String title;
  late VoidCallback onpress;
  Color? Bgcolor;
  Color? textcolor;
  bool isLoading = false;
  String? icon;
  bool isEnabled = true;

  CustomButtonAnimatedWidget(
      {required String title,
      required VoidCallback onpress,
      required bool isLoading,
      required color,
      required bool isEnabled,
      required textcolor,
      String? icon}) {
    this.title = title;
    this.onpress = onpress;
    this.isLoading = isLoading;
    this.isEnabled = isEnabled;
    Bgcolor = color;
    this.textcolor = textcolor;
    this.icon = icon;
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !isEnabled,
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width,
          height: 50,
        ),
        child: Container(
          foregroundDecoration: isEnabled?BoxDecoration(

          ):BoxDecoration(
            color: Colors.grey,
            backgroundBlendMode: BlendMode.saturation,
          ),
          decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: ElevatedButton(
            style: ButtonStyle(

              elevation: MaterialStateProperty.all<double?>(0),
              foregroundColor: MaterialStateProperty.all<Color?>(textcolor),

              backgroundColor: MaterialStateProperty.all(Colors.transparent),

              // side: MaterialStateProperty.all<BorderSide?>(BorderSide.none),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.white.withOpacity(0.04);
                  }
                  if (states.contains(MaterialState.focused) ||
                      states.contains(MaterialState.pressed)) {
                    return Colors.white.withOpacity(0.12);
                  }
                  return null; // Defer to the widget's default.
                },
              ),

              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  side: BorderSide(color: AppColors.buttonColor, width: 0),
                ),
              ),
            ),
            onPressed: () {
              onpress();
            },

            child: isLoading
                ? Lottie.asset(Assets.assetsLoader)
                : Stack(
                    children: [
                      icon != null
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:  EdgeInsets.all(10.w),
                                child: Image.asset(icon!),
                              ))
                          : const SizedBox(),
                      Center(child: Text(title,style: AppTextStyles.Title1WhiteTextStyle,),),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
