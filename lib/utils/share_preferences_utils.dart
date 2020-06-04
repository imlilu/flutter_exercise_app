import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharePrefrencesUtils {
  static SharePrefrencesUtils _prefrencesUtils;
  static SharedPreferences _sharePerence;

  static Future<SharePrefrencesUtils> get instance async {
    return await _getInstance();
  }

  static Future<SharePrefrencesUtils> _getInstance() async {
    if (_prefrencesUtils == null) {
      _prefrencesUtils = SharePrefrencesUtils._internal();
    }
    if (_sharePerence == null) {
      await _prefrencesUtils._init();
    }
    return _prefrencesUtils;
  }

  Future _init() async {
    _sharePerence = await SharedPreferences.getInstance();
  }

  SharePrefrencesUtils._internal() {}

  bool hasKey(String key) {
    if (_beforeCheck() || key == null) {
      return false;
    }
    return _sharePerence.containsKey(key);
  }

  Future<bool> putString(String key, String value) {
    if (_beforeCheck()) return null;
    return _sharePerence.setString(key, value);
  }

  Future<bool> putBool(String key, bool value) {
    if (_beforeCheck()) return null;
    return _sharePerence.setBool(key, value);
  }

  Future<bool> putDouble(String key, double value) {
    if (_beforeCheck()) return null;
    return _sharePerence.setDouble(key, value);
  }

  Future<bool> putInt(String key, int value) {
    if (_beforeCheck()) return null;
    return _sharePerence.setInt(key, value);
  }

  String getString(String key) {
    if (_beforeCheck()) return null;
    return _sharePerence.getString(key);
  }

  bool getBool(String key) {
    if (_beforeCheck()) return null;
    return _sharePerence.getBool(key);
  }

  double getDouble(String key) {
    if (_beforeCheck()) return null;
    return _sharePerence.getDouble(key);
  }

  int getInt(String key) {
    if (_beforeCheck()) return null;
    return _sharePerence.getInt(key);
  }

  static bool _beforeCheck() {
    if (_sharePerence == null) {
      return true;
    }
    return false;
  }
}
