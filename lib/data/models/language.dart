import 'package:calc_pro/core/strings/generated/l10n.dart';

class Language {
  final String flag;
  final String code;
  final String preference;
  final String country;

  Language({
    required this.flag,
    required this.code,
    required this.preference,
    required this.country,
  });

  static List<Language> get languages => [
    Language(
        country: S.current.US,
        flag: 'assets/flags/US.png',
        code: 'en',
        preference: S.current.EN_US),
    Language(
        country: S.current.VN,
        flag: 'assets/flags/VN.png',
        code: 'vi',
        preference: S.current.VI_VN),
    Language(
        country: S.current.JP,
        flag: 'assets/flags/JP.png',
        code: 'ja',
        preference: S.current.JA_JP),
    Language(
        country: S.current.FI,
        flag: 'assets/flags/FI.png',
        code: 'fi',
        preference: S.current.FI_FI),
    Language(
        country: S.current.KR,
        flag: 'assets/flags/KR.png',
        code: 'ko',
        preference: S.current.KO_KR),
    Language(
        country: S.current.FR,
        flag: 'assets/flags/FR.png',
        code: 'fr',
        preference: S.current.FR_FR),
    Language(
        country: S.current.TH,
        flag: 'assets/flags/TH.png',
        code: 'th',
        preference: S.current.TH_TH),
    Language(
        country: S.current.CN,
        flag: 'assets/flags/CN.png',
        code: 'zh',
        preference: S.current.ZH_CN),
    Language(
      country: S.current.ZA,
      flag: 'assets/flags/ZA.png',
      code: 'af',
      preference: S.current.AF_ZA,
    ),
    Language(
      country: S.current.AR,
      flag: 'assets/flags/XA.png',
      code: 'ar',
      preference: S.current.AR_XA,
    ),
    Language(
      country: S.current.ES,
      flag: 'assets/flags/ES.png',
      code: 'eu',
      preference: S.current.EU_ES,
    ),
    Language(
      country: S.current.IN,
      flag: 'assets/flags/IN.png',
      code: 'bn',
      preference: S.current.BN_IN,
    ),
    Language(
      country: S.current.BG,
      flag: 'assets/flags/BG.png',
      code: 'bg',
      preference: S.current.BG_BG,
    ),
    Language(
      country: S.current.ES,
      flag: 'assets/flags/ES.png',
      code: 'ca',
      preference: S.current.CA_ES,
    ),
    Language(
      country: S.current.CZ,
      flag: 'assets/flags/CZ.png',
      code: 'cs',
      preference: S.current.CS_CZ,
    ),
    Language(
      country: S.current.NL,
      flag: 'assets/flags/NL.png',
      code: 'nl',
      preference: S.current.NL_NL,
    ),
    Language(
      country: S.current.DK,
      flag: 'assets/flags/DK.png',
      code: 'da',
      preference: S.current.DA_DK,
    ),
    Language(
      country: S.current.PH,
      flag: 'assets/flags/PH.png',
      code: 'fil',
      preference: S.current.FIL_PH,
    ),
    Language(
      country: S.current.DE,
      flag: 'assets/flags/DE.png',
      code: 'de',
      preference: S.current.DE_DE,
    ),
    // Language(
    //   country: S.current.GR,
    //   flag: 'assets/flags/GR.png',
    //   code: 'el',
    //   preference: S.current.EL_GR,
    // ),
    Language(
      country: S.current.IL,
      flag: 'assets/flags/IL.png',
      code: 'he',
      preference: S.current.HE_IL,
    ),
    Language(
      country: S.current.IN,
      flag: 'assets/flags/IN.png',
      code: 'hi',
      preference: S.current.HI_IN,
    ),
    Language(
      country: S.current.HU,
      flag: 'assets/flags/HU.png',
      code: 'hu',
      preference: S.current.HU_HU,
    ),
    Language(
      country: S.current.IS,
      flag: 'assets/flags/IS.png',
      code: 'is',
      preference: S.current.IS_IS,
    ),
    Language(
      country: S.current.ID,
      flag: 'assets/flags/ID.png',
      code: 'id',
      preference: S.current.ID_ID,
    ),
    Language(
      country: S.current.IT,
      flag: 'assets/flags/IT.png',
      code: 'it',
      preference: S.current.IT_IT,
    ),
    Language(
      country: S.current.LV,
      flag: 'assets/flags/LV.png',
      code: 'lv',
      preference: S.current.LV_LV,
    ),
    Language(
      country: S.current.LT,
      flag: 'assets/flags/LT.png',
      code: 'lt',
      preference: S.current.LT_LT,
    ),
    Language(
      country: S.current.MY,
      flag: 'assets/flags/MY.jpg',
      code: 'ms',
      preference: S.current.MS_MY,
    ),
    Language(
      country: S.current.NO,
      flag: 'assets/flags/NO.png',
      code: 'nb',
      preference: S.current.NB_NO,
    ),
    Language(
      country: S.current.PL,
      flag: 'assets/flags/PL.png',
      code: 'pl',
      preference: S.current.PL_PL,
    ),
    Language(
      country: S.current.PT,
      flag: 'assets/flags/PT.png',
      code: 'pt',
      preference: S.current.PT_PT,
    ),
    Language(
      country: S.current.RO,
      flag: 'assets/flags/RO.jpg',
      code: 'ro',
      preference: S.current.RO_RO,
    ),
    Language(
      country: S.current.RU,
      flag: 'assets/flags/RU.png',
      code: 'ru',
      preference: S.current.RU_RU,
    ),
    Language(
      country: S.current.SK,
      flag: 'assets/flags/SK.png',
      code: 'sk',
      preference: S.current.SK_SK,
    ),
    Language(
      country: S.current.ES,
      flag: 'assets/flags/ES.png',
      code: 'es',
      preference: S.current.ES_ES,
    ),
    Language(
      country: S.current.SE,
      flag: 'assets/flags/SE.png',
      code: 'sv',
      preference: S.current.SV_SE,
    ),
    Language(
      country: S.current.IN,
      flag: 'assets/flags/IN.png',
      code: 'ta',
      preference: S.current.TA_IN,
    ),
    Language(
      country: S.current.IN,
      flag: 'assets/flags/IN.png',
      code: 'te',
      preference: S.current.TE_IN,
    ),
    Language(
      country: S.current.TR,
      flag: 'assets/flags/TR.png',
      code: 'tr',
      preference: S.current.TR_TR,
    ),
    Language(
      country: S.current.UA,
      flag: 'assets/flags/UA.png',
      code: 'uk',
      preference: S.current.UK_UA,
    ),
  ];
}
