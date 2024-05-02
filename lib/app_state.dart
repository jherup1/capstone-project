import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _roleCache = [];
  List<String> get roleCache => _roleCache;
  set roleCache(List<String> _value) {
    _roleCache = _value;
  }

  void addToRoleCache(String _value) {
    _roleCache.add(_value);
  }

  void removeFromRoleCache(String _value) {
    _roleCache.remove(_value);
  }

  void removeAtIndexFromRoleCache(int _index) {
    _roleCache.removeAt(_index);
  }

  void updateRoleCacheAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _roleCache[_index] = updateFn(_roleCache[_index]);
  }

  void insertAtIndexInRoleCache(int _index, String _value) {
    _roleCache.insert(_index, _value);
  }

  LatLng? _tapped;
  LatLng? get tapped => _tapped;
  set tapped(LatLng? _value) {
    _tapped = _value;
  }

  String _loginAttempt = '';
  String get loginAttempt => _loginAttempt;
  set loginAttempt(String _value) {
    _loginAttempt = _value;
  }

  String _createAccountAttempt = '';
  String get createAccountAttempt => _createAccountAttempt;
  set createAccountAttempt(String _value) {
    _createAccountAttempt = _value;
  }

  String _updateAccountAttempt = '';
  String get updateAccountAttempt => _updateAccountAttempt;
  set updateAccountAttempt(String _value) {
    _updateAccountAttempt = _value;
  }

  String _passwordChangeAttempt = '';
  String get passwordChangeAttempt => _passwordChangeAttempt;
  set passwordChangeAttempt(String _value) {
    _passwordChangeAttempt = _value;
  }

  int _smile = 5;
  int get smile => _smile;
  set smile(int _value) {
    _smile = _value;
  }

  bool _schoolSearchActive = false;
  bool get schoolSearchActive => _schoolSearchActive;
  set schoolSearchActive(bool _value) {
    _schoolSearchActive = _value;
  }

  bool _programSearchActive = false;
  bool get programSearchActive => _programSearchActive;
  set programSearchActive(bool _value) {
    _programSearchActive = _value;
  }
}
