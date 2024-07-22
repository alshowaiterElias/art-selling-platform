import 'package:art_selling_platform/bindings/general_bindings.dart';
import 'package:art_selling_platform/data/repos/authentication.dart';
import 'package:art_selling_platform/routes/app_routes.dart';
import 'package:art_selling_platform/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  //todo: bindings
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  //splash screen wait untill the program finishes its bindings
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //todo: localStorage
  await GetStorage.init();
  //todo: firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepo()));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GeneralBindings(),
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      getPages: TAppRoutes.pages,
      darkTheme: TAppTheme.darkTheme,
      home: const Scaffold(
        body: CircularProgressIndicator(),
      ),
    );
  }
}
