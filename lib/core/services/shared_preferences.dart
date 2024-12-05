import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const _languageKey = 'language';


 static Future<void> setLanguage (Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, locale.languageCode);
  }

  static Future<Locale> getLanguage() async {
    final prefs= await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_languageKey) ?? 'en';
    return Locale (languageCode);
  }

  static Future setLocationPermission(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('locationPermission', status );
  }

  static Future<bool> getLocationPermission() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('locationPermission') ?? false;
 }

}