import 'package:flutter/material.dart';
import '/backend/backend.dart';
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
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
