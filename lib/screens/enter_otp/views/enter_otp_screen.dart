import 'package:assignment/constants/app_texts.dart';
import 'package:assignment/routes/app_pages.dart';
import 'package:assignment/screens/enter_mobile/bloc/enter_mobile_bloc.dart';
import 'package:assignment/screens/enter_otp/bloc/enter_otp_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../custom_widgets/animated_custom_button.dart';
import '../../../custom_widgets/app_logo.dart';
import '../../../custom_widgets/blue_curved_container.dart';
import '../../../custom_widgets/custom_header.dart';
import '../../../custom_widgets/custom_pin_code_field.dart';
import '../../../custom_widgets/custom_subheader.dart';

class EnterOtpScreen extends StatelessWidget {
  EnterOtpScreen({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final phoneNumber = context.read<EnterMobileBloc>().state.mobileNo;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Stack(
          children: [
            BlueCurvedContainer(
              height: 100.w,
              child: SizedBox(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 4,
                    child: BlocBuilder<EnterOtpBloc, EnterOtpState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLogo(),
                            Padding(
                              padding: EdgeInsets.only(top: 20.w, bottom: 10.w),
                              child: CustomHeader(
                                text: "Enter OTP",
                              ),
                            ),
                            CustomSubHeader(
                                text: "OTP has been sent to +91-$phoneNumber"),
                            SizedBox(
                              height: 40,
                            ),
                            CustomPinCodeField(
                                controller: _controller,
                                onChange: (String pin) => context
                                    .read<EnterOtpBloc>()
                                    .add(CheckPinCodeField(pin))),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: CustomButtonAnimatedWidget(
                                title: 'Verify',
                                onpress: () => context.read<EnterOtpBloc>().add(
                                    VerifyOtpEvent(
                                        _controller.text, Get.arguments[0])),
                                isLoading: state.isLoading,
                                color: Colors.amber,
                                textcolor: Colors.white,
                                isEnabled: state.isEnabled,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.w),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () => Get.back(),
                                  child: Text(
                                    "Retry",
                                    style: AppTextStyles.Title2TextStyle,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
