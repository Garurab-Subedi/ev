import 'package:shared_preferences/shared_preferences.dart';

class MemoryManagement {
  static SharedPreferences? prefs;

  static Future<bool> init() async {
    prefs = await SharedPreferences.getInstance();
    return true;
  }

  static String? getToken() {
    return prefs != null ? prefs!.getString('token') : null;
  }

  static void setToken(String token) {
    prefs!.setString('token', token);
  }

  static void removeToken() {
    prefs!.remove('token');
  }

  static int? getUserID() {
    return prefs != null ? prefs!.getInt('UserID') : null;
  }

  static void setUserID(int? userId) {
    if (userId != null) {
      prefs!.setInt('UserID', userId);
    } else {
      removeUserID(); // Remove UserID if null
    }
  }

  static void removeUserID() {
    prefs!.remove('UserID');
  }

  static int? getStationID() {
    return prefs != null ? prefs!.getInt('stationId') : null;
  }

  static void setStationID(int? stationId) {
    if (stationId != null) {
      prefs!.setInt('stationId', stationId);
    } else {
      removeStationID(); // Remove StationID if null
    }
  }

  static void removeStationID() {
    prefs!.remove('stationId');
  }

  static int? getChargerID() {
    return prefs != null ? prefs!.getInt('ChargerID') : null;
  }

  static void setChargerID(int? chargerId) {
    if (chargerId != null) {
      prefs!.setInt('ChargerID', chargerId);
    } else {
      removeChargerID(); // Remove ChargerID if null
    }
  }

  static void removeChargerID() {
    prefs!.remove('ChargerID');
  }

  static void removeAll() async {
    await prefs!.remove('token');
    await prefs!.remove('UserID');
    await prefs!.remove('stationId');
    await prefs!.remove('ChargerID');
  }
}
