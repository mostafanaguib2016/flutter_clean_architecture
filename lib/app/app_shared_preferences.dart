import 'package:flutter_clean_architecture/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANGUAGE = "PREFS_KEY_LANG";

class AppSharedPreferences {

  final SharedPreferences _sharedPreferences;

  AppSharedPreferences(this._sharedPreferences);

  Future<String> getLanguage() async{
    String? language = _sharedPreferences.getString(PREFS_KEY_LANGUAGE);
    if(language != null && language.isNotEmpty) {
      return language;
    }else{
      return LanguageType.ENGLISH.getValue();
    }

  }

}