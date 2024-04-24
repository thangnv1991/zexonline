import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zexonline/src/di/di_graph_setup.dart';
import 'package:zexonline/src/locale/translation_manager.dart';
import 'package:zexonline/src/utils/app_constants.dart';
import 'package:zexonline/src/utils/app_pages.dart';
import 'package:zexonline/src/utils/app_themes.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup Dependencies Graph
  await setupDependenciesGraph();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        enableLog: true,
        initialRoute: AppPages.splash,
        getPages: AppPages.pages,
        locale: Get.find<TranslationManager>().locale,
        fallbackLocale: TranslationManager.fallbackLocaleVN,
        translations: Get.find<TranslationManager>(),
        title: AppConstants.appName,
        theme: AppThemes.lightTheme,
      ),
    );
  }
}
