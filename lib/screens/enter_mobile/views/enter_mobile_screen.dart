

import 'package:assignment/screens/enter_mobile/bloc/enter_mobile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/app_texts.dart';
import '../../../custom_widgets/animated_custom_button.dart';
import '../../../custom_widgets/app_logo.dart';
import '../../../custom_widgets/blue_curved_container.dart';
import '../../../custom_widgets/custom_header.dart';
import '../../../routes/app_pages.dart';

class EnterMobileScreen extends StatefulWidget {
  const EnterMobileScreen({Key? key}) : super(key: key);

  @override
  State<EnterMobileScreen> createState() => _EnterMobileScreenState();
}

class _EnterMobileScreenState extends State<EnterMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, boxConstraints) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Stack(
              children: [
                BlueCurvedContainer(
                  height: 100.w,
                  child: SizedBox(),
                ),
                Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: BlocBuilder<EnterMobileBloc, EnterMobileState>(

                          builder: (context, state) {
                            print(state);
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppLogo(),
                                SizedBox(
                                  height: 40.w,
                                ),
                                CustomHeader(
                                  text: "Get Started",
                                ),
                                SizedBox(
                                  height: 20.w,
                                ),
                                Container(
                                  height: 50.w,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.w),
                                    color: Colors.grey[200],
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            '+91',
                                            style: AppTextStyles
                                                .Title1BlackTextStyle,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const VerticalDivider(
                                              thickness: 1,
                                              color: Colors.black,
                                            ),
                                            Expanded(
                                              child: TextField(
                                                enabled: !state.isLoading,
                                                textAlign: TextAlign.center,
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                ],
                                                onChanged: (text) => context
                                                    .read<EnterMobileBloc>()
                                                    .add(CheckMobileNumber(text)),
                                                maxLength: 10,
                                                decoration: InputDecoration(
                                                  fillColor: Colors.grey[200],
                                                  contentPadding: EdgeInsets.zero,
                                                  border: InputBorder.none,
                                                  focusedBorder: InputBorder.none,
                                                  enabledBorder: InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                  counterText: '',
                                                  hintText: '9888888888',
                                                ),
                                                style: AppTextStyles
                                                    .Title1BlackTextStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.w),
                                  child: CustomButtonAnimatedWidget(
                                    title: 'Continue',
                                    onpress: () => context
                                        .read<EnterMobileBloc>()
                                        .add(SendOtp()),
                                    isLoading: state.isLoading,
                                    isEnabled: state.isEnabled,
                                    color: Colors.amber,
                                    textcolor: Colors.white,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
