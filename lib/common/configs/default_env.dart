import 'package:flutter_cinema/common/configs/env.dart';

class DefaultConfig extends EnvConfig {
  final _splashScreenSecondTimeOut = 2;
  final _host = 'https://iphui-dev.acaziasoft.com/';
  final _baseImageUrl = 'statics/';
  final _productImageUrl = 'https://youngkids-dev.acaziasoft.com/statics/';
  final _environment = 'dev';
  final _basicAuth = 'anonymous';
  final _bearerAuth = 'Bearer';
  final _googleMapApiKey = 'AIzaSyDdM0cR-vVDPjT0rWs6HdHBfbokSOcRz6Q';

  @override
  String getBaseImageUrl() {
    return _host + _baseImageUrl;
  }

  @override
  String getEnvironment() {
    return _environment;
  }

  @override
  String getHost() {
    return _host;
  }

  @override
  String getBasicAuth() {
    return _basicAuth;
  }

  @override
  String getBearerAuth() {
    return _bearerAuth;
  }

  @override
  String getGoogleMapApiKey() {
    return _googleMapApiKey;
  }

  @override
  String getProductImageUrl() {
    return _productImageUrl;
  }

  @override
  int getSplashScreenSecondTimeOut() {
    return _splashScreenSecondTimeOut;
  }

  @override
  String getDeepLinksAndroid() {
    return 'https://football-applink.acaziasoft.com';
  }

  @override
  String getDeepLinksIos() {
    return 'app://football-applink.acaziasoft.com';
  }
}
