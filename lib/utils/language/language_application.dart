import 'dart:ui';

class LanguageApplication {

  static final LanguageApplication _application = LanguageApplication._internal();

  factory LanguageApplication() {
    return _application;
  }

  LanguageApplication._internal();

  final List<String> supportedLanguages = [
    "English",
    "Chinese",
  ];

  final List<String> supportedLanguagesCodes = [
    "en",
    "zh",
  ];

  //returns the list of supported Locales
  Iterable<Locale> supportedLocales() =>
      supportedLanguagesCodes.map<Locale>((language) => Locale(language, ""));

  //function to be invoked when changing the language
  LocaleChangeCallback onLocaleChanged;
}

LanguageApplication languageApplication = LanguageApplication();

typedef void LocaleChangeCallback(Locale locale);