import 'package:art_selling_platform/features/authentication/views/onBoarding/onBoarding.dart';
import 'package:art_selling_platform/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  //todo: bindings
  //todo: localStorage
  //todo: firebase
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const OnBoarding(),
    );
  }
}
