import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider with ChangeNotifier {
  bool _isDarkModeEnabled = false;
  bool get isDarkModeEnabled => _isDarkModeEnabled;
  int _sebhaCounter = 0;
  int get sebhaCounter => _sebhaCounter;
  double _rotationAngle = 0.0;
  double get rotationAngle => _rotationAngle;
  bool _isArabicEnabeld = false;
  bool get isArabicEnabeld => _isArabicEnabeld;
  String _language = "EN";
  String get language => _language;
  AppProvider() {
    _isDarkModeEnabled = false;
    _sebhaCounter = 0;
    _isArabicEnabeld = false;
    _language = "EN";
    _loadThemeFromPreferences();
    _loadSebhaCounterFromPreferences();
    _loadBoolLanguageFromPreferences();
    _loadLanguageFromPreferences();
  }
  void toggleTheme() {
    _isDarkModeEnabled = !_isDarkModeEnabled;
    _saveThemeToPreferences();
    notifyListeners();
  }

  void sebhaAnimatin() {
    _sebhaCounter++;
    _rotationAngle += 25;
    _saveSebhaCounterFromPref();
    notifyListeners();
  }

  void sebhaCounterToZero() {
    _sebhaCounter = 0;
    notifyListeners();
  }

  Future<void> _loadThemeFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkModeEnabled = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  Future<void> _saveThemeToPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _isDarkModeEnabled);
  }

  Future<void> _loadSebhaCounterFromPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _sebhaCounter = preferences.getInt("sebha_counter") ?? 0;
    notifyListeners();
  }

  Future<void> _saveSebhaCounterFromPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("sebha_counter", _sebhaCounter);
  }

  void toggleLanguage() {
    _isArabicEnabeld = !_isArabicEnabeld;
    _saveBoolLanguageToPreferences();
    _saveLanguageToPreferences();
    notifyListeners();
  }

  void changeLanguage() {
    _isArabicEnabeld == false ? _language = "EN" : _language = "AR";
    notifyListeners();
  }

  String textLanguage(String txt) {
    if (_language == "AR" && txt == "soura name") {
      txt = "اسم السورة";
    } else if (_language == "AR" && txt == "adad ayat") {
      txt = "عدد الآيات";
    } else if (_language == "AR" && txt == "Al-Ahadeth") {
      txt = "الأحاديث";
    } else if (_language == "AR" && txt == "islami") {
      txt = "إسلامي";
    } else if (_language == "AR" && txt == "Hadeth number") {
      txt = "حديث رقم";
    } else if (_language == "AR" && txt == "radio") {
      txt = "راديو";
    } else if (_language == "AR" && txt == "sepha") {
      txt = "سبحة";
    } else if (_language == "AR" && txt == "ahadeth") {
      txt = "أحاديث";
    } else if (_language == "AR" && txt == "quran") {
      txt = "قرآن";
    } else if (_language == "AR" && txt == "settings") {
      txt = "اعدادات";
    } else if (_language == "AR" && txt == "Change Theme") {
      txt = "تغيير اللون";
    } else if (_language == "AR" && txt == "Change Language") {
      txt = "تغيير اللغة";
    }
    return txt;
  }

  Future<void> _loadBoolLanguageFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isArabicEnabeld = prefs.getBool('isArabicEnabeld') ?? false;
    notifyListeners();
  }

  Future<void> _saveBoolLanguageToPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isArabicEnabeld', _isArabicEnabeld);
  }

  Future<void> _loadLanguageFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _language = prefs.getString('isArabic') ?? "EN";
    notifyListeners();
  }

  Future<void> _saveLanguageToPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('isArabic', _language);
  }
}
