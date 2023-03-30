import 'package:flutter/material.dart';

import '../constants/app_texts.dart';

class CustomHeader extends StatelessWidget {
  final String text;
  const CustomHeader({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
     text,
      style: AppTextStyles.Header2TextStyle,
    );
  }
}
