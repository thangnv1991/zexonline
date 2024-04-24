import 'package:zexonline/src/helper/log_helper.dart';
import 'package:zexonline/src/utils/app_constants.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum Flavor { dev, prod, local }

class AppApiConfig {
  /// this is if flavor has been initialized by calling init()
  static bool _initialized = false;

  static late final Flavor _flavor;

  /// The flavor pulled from the package name.
  /// NOTE: Environment().init() MUST be called before flavor is available!
  static Flavor get flavor {
    if (!_initialized) {
      throw 'Environment has not been initialized!  '
          'Please call Environment.init() before using '
          'flavor or any other variables requiring flavor';
    }
    return _flavor;
  }

  /// Initializes the flavor from either the debug value or the package name
  Future<void> init() async {
    final packageInfo = await PackageInfo.fromPlatform();

    switch (packageInfo.packageName.split('.').last) {
      case 'dev':
        LogHelper.d('Dev Environment');
        _flavor = Flavor.dev;
        break;
      default:
        LogHelper.d('Production Environment');
        _flavor = Flavor.prod;
        break;
    }
    _initialized = true;
  }

  static String get baseApiUrl => '$apiUrl/';

  static String get apiUrl {
    switch (flavor) {
      case Flavor.prod:
        return AppConstants.API_PROD_URL;
      case Flavor.dev:
        return AppConstants.API_DEV_URL;
      case Flavor.local:
        return AppConstants.API_LOCAL_URL;
    }
  }
}
