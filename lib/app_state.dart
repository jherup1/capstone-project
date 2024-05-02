import 'package:flutter/material.dart';
import '/backend/backend.dart';
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
  set roleCache(List<String> value) {
    _roleCache = value;
  }

  void addToRoleCache(String value) {
    _roleCache.add(value);
  }

  void removeFromRoleCache(String value) {
    _roleCache.remove(value);
  }

  void removeAtIndexFromRoleCache(int index) {
    _roleCache.removeAt(index);
  }

  void updateRoleCacheAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _roleCache[index] = updateFn(_roleCache[index]);
  }

  void insertAtIndexInRoleCache(int index, String value) {
    _roleCache.insert(index, value);
  }

  LatLng? _tapped;
  LatLng? get tapped => _tapped;
  set tapped(LatLng? value) {
    _tapped = value;
  }

  String _loginAttempt = '';
  String get loginAttempt => _loginAttempt;
  set loginAttempt(String value) {
    _loginAttempt = value;
  }

  String _createAccountAttempt = '';
  String get createAccountAttempt => _createAccountAttempt;
  set createAccountAttempt(String value) {
    _createAccountAttempt = value;
  }

  String _updateAccountAttempt = '';
  String get updateAccountAttempt => _updateAccountAttempt;
  set updateAccountAttempt(String value) {
    _updateAccountAttempt = value;
  }

  String _passwordChangeAttempt = '';
  String get passwordChangeAttempt => _passwordChangeAttempt;
  set passwordChangeAttempt(String value) {
    _passwordChangeAttempt = value;
  }

  int _smile = 5;
  int get smile => _smile;
  set smile(int value) {
    _smile = value;
  }

  bool _schoolSearchActive = false;
  bool get schoolSearchActive => _schoolSearchActive;
  set schoolSearchActive(bool value) {
    _schoolSearchActive = value;
  }

  bool _programSearchActive = false;
  bool get programSearchActive => _programSearchActive;
  set programSearchActive(bool value) {
    _programSearchActive = value;
  }
}
