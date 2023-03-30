import 'package:assignment/constants/app_texts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Center(
        child: Text("HomeScreen", style: AppTextStyles.Title1BlackTextStyle,),
      ),
    );
  }
}
