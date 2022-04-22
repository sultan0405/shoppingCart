import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

class AppConstant {



  static const SUPPORTED_LANGS = [EN_LOCALE, RU_LOCALE];
  static const TR_LOCALE = Locale("tr", "TR");
  static const EN_LOCALE = Locale("en", "US");
  static const RU_LOCALE = Locale("ru", "RU");
  static const AR_LOCALE = Locale("ar", "RU");
  static const LANG_PATH = "assets/lang";


  void changeLange(){
    SUPPORTED_LANGS.contains(EN_LOCALE)? 
    SUPPORTED_LANGS.removeWhere((element) => element == EN_LOCALE)
    : SUPPORTED_LANGS.add(EN_LOCALE);
  }
  
}