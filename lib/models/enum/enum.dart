import '../../app/constants/locale_constant.dart';

enum LanguageCode {
  en(localeCode: LocaleConstants.en),
  ja(localeCode: LocaleConstants.ja);

  const LanguageCode({
    required this.localeCode,
  });

  final String localeCode;

  static LanguageCode get defaultValue => en;
}
