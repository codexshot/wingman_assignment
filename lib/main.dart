import 'package:assignment/provider/providers.dart';
import 'package:assignment/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'constants/app_themes.dart';

void main()  {

  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppProvider().getProviderList(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            builder: (BuildContext context, Widget? child) {
              final MediaQueryData data = MediaQuery.of(context);
              return MediaQuery(
                data: data.copyWith(
                  textScaleFactor: 1,
                  boldText: false,
                ),
                child: child!,
              );
            },
            theme: AppThemes.LightModeTheme,
            getPages: AppPages.routes,
            initialRoute: AppPages.INITIAL,
          );
        },
      ),
    );
  }
}
