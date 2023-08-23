import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static const String token = "token";
  static const String tenantId = "tenantId";
  static const String type = "type";
  static const String hostelId = "hostelId";
  static const String brightness = "brightness";
  static const String lang = "language";
  static const String appLang = "app_language";
  static const String langCode = "lang_code";

  static Future<bool> clearPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }

  static Future<bool> setBrightness(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(brightness, isDark);
  }

  static Future<bool?> getBrightness() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(brightness);
  }

  static Future<bool> setToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(token, 'Bearer $value');
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(token);
  }

  static Future<bool> setTenantId(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(tenantId, value);
  }

  static Future<String?> getTenantId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(tenantId);
  }

  static Future<bool> setHostelId(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(hostelId, value);
  }

  static Future<String?> getHostelId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(hostelId);
  }

  static Future<bool> setUserType(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(type, value);
  }

  static Future<String?> getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(type);
  }

  static Future<List<String>> getSearchList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var list = prefs.getStringList('search');
    print('list = $list');
    return list ?? [];
  }

  static Future<bool> setSearch(String query) async {
    var list = await getSearchList();
    if (list.contains(query)) return false;
    list.add(query);
    if (list.length > 3) list.removeAt(0);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList('search', list);
  }

  static Future<bool?> getAppLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(appLang);
  }

  static Future<bool> setAppLanguage(bool toApp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(appLang, toApp);
  }

  static Future<String?> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(lang);
  }

  static Future<bool> setLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(lang, language);
  }

  static Future<String?> getLanguageCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(langCode);
  }

  static Future<bool> setLanguageCode(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(langCode, languageCode);
  }
}
