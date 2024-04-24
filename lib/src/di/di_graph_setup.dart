import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:zexonline/src/core/managers/connectivity_manager.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/core/managers/permission_manager.dart';
import 'package:zexonline/src/core/model/response/user_response.dart';
import 'package:zexonline/src/deeplink/deeplink_manager.dart';
import 'package:zexonline/src/locale/translation_manager.dart';
import 'package:zexonline/src/utils/app_api_config.dart';
import 'package:zexonline/src/utils/app_shared.dart';
import 'package:path_provider/path_provider.dart';

part 'environment_module.dart';
part 'register_core_module.dart';
part 'register_manager_module.dart';

Future<void> setupDependenciesGraph() async {
  // load all global settings
  await _initializeEnvironment();

  // Core Dependencies
  await _registerCoreModule();

  // Managers Dependencies
  _registerManagersModule();
}
