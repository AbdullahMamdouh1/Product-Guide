import 'package:connectivity_plus/connectivity_plus.dart';

/// واجهة مجردة لفحص الاتصال بالإنترنت
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

/// تنفيذ الواجهة باستخدام Connectivity
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
