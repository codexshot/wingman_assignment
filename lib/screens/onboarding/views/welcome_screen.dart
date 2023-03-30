import 'package:assignment/screens/onboarding/bloc/welcome_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../custom_widgets/animated_custom_button.dart';
import '../../../custom_widgets/blue_curved_container.dart';
import '../../../custom_widgets/custom_header.dart';
import '../../../custom_widgets/custom_subheader.dart';
import '../../../custom_widgets/custom_text_field.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              BlueCurvedContainer(
                height: 100.w,
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: BlocBuilder<WelcomeScreenBloc, WelcomeScreenState>(
                  builder: (context, state) {
                    return AbsorbPointer(
                      absorbing: state.isLoading,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 150.w,
                          ),
                          CustomHeader(
                            text: 'Welcome',
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          CustomSubHeader(
                            text:
                                "Looks like you are new here. Tell us a bit about yourself.",
                          ),
                          SizedBox(
                            height: 20.w,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10.w),
                            child: FormBuilder(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  CustomTextField(
                                    heading: 'Name',
                                    validators: FormBuilderValidators.required(
                                        errorText: "Enter Name"),
                                    hint: 'Enter Name',
                                  ),
                                  SizedBox(
                                    height: 20.w,
                                  ),
                                  CustomTextField(
                                    heading: 'Email',
                                    validators: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                          errorText: "Enter Email"),
                                      FormBuilderValidators.email(
                                          errorText: "Enter Valid Email"),
                                    ]),
                                    hint: 'Enter Email',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.w,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: CustomButtonAnimatedWidget(
                              title: 'Submit',
                              onpress: () {
                                _formKey.currentState?.save();

                                if (_formKey.currentState!.validate()) {
                                  // Do something with the form data
                                  print(_formKey.currentState?.value);
                                  context.read<WelcomeScreenBloc>().add(
                                      RegisterUserEvent(
                                          _formKey.currentState?.fields['Name']
                                              ?.value,
                                          _formKey.currentState?.fields['Email']
                                              ?.value));
                                }
                              },
                              isLoading: state.isLoading,
                              color: Colors.amber,
                              textcolor: Colors.white,
                              isEnabled: true,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
