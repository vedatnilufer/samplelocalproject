import 'dart:io';
import '../../product/enum/base_enum.dart';

controlInternetConnection() async {
  try {
    final result = await InternetAddress.lookup(BaseEnum.baseUrl.rawValue);
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } catch (e) {
    return false;
  }
}
