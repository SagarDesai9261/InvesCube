import 'dart:io';
class AdHelper{
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {

      return 'ca-app-pub-2669599292701410/9766714738';
      //return 'ca-app-pub-2669599292701410/5409405041';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }
}