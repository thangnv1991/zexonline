import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/widgets/base/toast/app_toast.dart';
import 'package:get/get.dart';

class ConnectivityManager with WidgetsBindingObserver {
  late bool _isConnectInternet;
  ConnectivityResult _typeConnectivity = ConnectivityResult.none;

  ConnectivityManager() {
    _init();
  }

  /// Get Status is connect to Internet
  get isConnect => _isConnectInternet;

  /// Type Connect Wifi, Mobile, None
  get typeConnectivity => _typeConnectivity;

  ConnectivityResult? currentResult;

  _init() async {
    WidgetsBinding.instance.addObserver(this);
    _isConnectInternet = await Connectivity().checkConnectivity() != ConnectivityResult.none;

    // Listen when reconnect or disconnect
    // Listen when reconnect or disconnect
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _typeConnectivity = result;
      switch (result) {
        case ConnectivityResult.wifi:
        case ConnectivityResult.ethernet:
        case ConnectivityResult.mobile:
          if (currentResult != null && currentResult != ConnectivityResult.mobile) {
            showConnectWifi(LocaleKey.alertConnect.tr,
                isConnect: true, backgroundColor: Colors.black54);
            _isConnectInternet = true;
          }
          currentResult = ConnectivityResult.mobile;
          break;
        case ConnectivityResult.bluetooth:
        case ConnectivityResult.none:
          if (currentResult != null && currentResult != ConnectivityResult.none) {
            showConnectWifi(LocaleKey.alertDisconnect.tr,
                isConnect: false, backgroundColor: Colors.black54);
            _isConnectInternet = false;
          }
          currentResult = ConnectivityResult.none;
          break;
        case ConnectivityResult.vpn:
          // TODO: Handle this case.
          break;
        default:
          break;
      }
    });
  }

  /// Check state of App to reset state of Connectivity
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      currentResult = null;
    }
  }
}
