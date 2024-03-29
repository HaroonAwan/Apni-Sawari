import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../utils/connectivity_status.dart';
import 'dart:async';
import 'package:connectivity/connectivity.dart';


class ConnectivityService {
  // Create our public controller
  StreamController<ConnectivityStatus> connectionStatusController = StreamController<ConnectivityStatus>();

  ConnectivityService() {
    // Subscribe to the connectivity Chanaged Steam
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Use Connectivity() here to gather more info if you need t

      connectionStatusController.add(_getStatusFromResult(result));
    });
  }

  // Convert from the third part enum to our own enum
  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.WiFi;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
      default:
        return ConnectivityStatus.Offline;
    }
  }
}

bool checkConnectionStatus(BuildContext context){
  var connectionStatus = Provider.of<ConnectivityStatus>(context);
  if (!(connectionStatus == ConnectivityStatus.WiFi ||
      connectionStatus == ConnectivityStatus.Cellular)) {
    return false;
  }
  else{
    return true;
  }
}