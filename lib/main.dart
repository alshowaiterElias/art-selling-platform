import 'package:art_selling_platform/features/authentication/views/onBoarding/onBoarding.dart';
import 'package:art_selling_platform/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  //todo: bindings
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  //todo: localStorage
  //todo: firebase

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // .then((FirebaseApp value) => Get.put(AuthenticationRepo()));
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
