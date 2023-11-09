import 'package:flutter/widgets.dart';
import 'package:wallet/widgets/CryptoList.dart';

class CryptoInfoProvider with ChangeNotifier {
  List<CryptoInfo> _cryptoData = [];

  List<CryptoInfo> get cryptoData => _cryptoData;

  set cryptoData(List<CryptoInfo> data) {
    _cryptoData = data;
    notifyListeners();
  }
}
