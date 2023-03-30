import 'package:flutter/material.dart';

import '../constants/app_texts.dart';

class CustomSubHeader extends StatelessWidget {
  final String text;
  const CustomSubHeader({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.Title2TextStyle,
    );
  }
}
