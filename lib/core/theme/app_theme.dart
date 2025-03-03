import 'package:reqresz/config.dart';

enum ThemeType {
  light,
}

class AppTheme {
  static ThemeType defaultTheme = ThemeType.light;

  Color primary;
  Color secPrimary;
  Color darkText;
  Color lightText;
  Color lightBg;
  Color foreground;
  Color whiteBg;
  Color stroke;
  Color fieldCardBg;
  Color trans;
  Color green;
  Color greenColor;
  Color greenLight;
  Color online;
  Color red;
  Color blue;
  Color bluelight;
  Color black;
  Color whiteColor;
  Color rateColor;
  Color grey10;
  Color grey15;
  Color grey20;
  Color grey25;
  Color grey40;
  Color grey45;
  Color grey60;
  Color grey75;
  Color grey85;
  Color grey90;
  Color grey95;
  Color white;
  Color borderButtonWhite;
  Color pending, accepted, ongoing, cartBottomBg;

  /// Default constructor
  AppTheme({
    required this.primary,
    required this.secPrimary,
    required this.darkText,
    required this.lightText,
    required this.lightBg,
    required this.foreground,
    required this.whiteBg,
    required this.stroke,
    required this.fieldCardBg,
    required this.trans,
    required this.online,
    required this.red,
    required this.green,
    required this.greenLight,
    required this.blue,
    required this.bluelight,
    required this.black,
    required this.whiteColor,
    required this.rateColor,
    required this.pending,
    required this.accepted,
    required this.ongoing,
    required this.greenColor,
    required this.cartBottomBg,
    required this.borderButtonWhite,
    required this.grey10,
    required this.grey15,
    required this.grey20,
    required this.grey25,
    required this.grey40,
    required this.grey45,
    required this.grey60,
    required this.grey75,
    required this.grey85,
    required this.grey90,
    required this.grey95,
    required this.white,
  });

  /// fromType factory constructor
  factory AppTheme.defaultType() {
    return AppTheme(
      primary: const Color(0xffFF7629),
      secPrimary: const Color(0xffFEEFE9),
      darkText: const Color(0xff00162E),
      lightText: const Color(0xff767676),
      foreground: const Color(0xffFDFDFD),
      lightBg: const Color(0xffF2F2F2),
      whiteBg: const Color(0xffFFFFFF),
      stroke: const Color(0xffE5E8EA),
      fieldCardBg: const Color(0xffFFFFFF),
      whiteColor: const Color(0xffFFFFFF),
      rateColor: const Color(0xffFFC412),
      trans: Colors.transparent,
      green: Colors.green,
      greenLight: const Color(0xffE9F1E5),
      online: Colors.green,
      red: const Color(0xffFF4B4B),
      blue: const Color(0xff2188FF),
      bluelight: const Color(0xffE5ECFF),
      black: const Color(0xff212121),
      pending: const Color(0xffFDB448),
      accepted: const Color(0xff48BFFD),
      ongoing: const Color(0xffFF7456),
      grey10: const Color(0xff181818),
      grey15: const Color(0xff282828),
      grey20: const Color(0xff333333),
      grey25: const Color(0xff404040),
      grey40: const Color(0xff616161),
      grey45: const Color(0xff757575),
      grey60: const Color(0xff9E9E9E),
      grey75: const Color(0xffBDBDBD),
      grey85: const Color(0xffD9D9D9),
      grey90: const Color(0xffEEEEEE),
      grey95: const Color(0xffF8F8F8),
      white: const Color(0xffFFFFFF),
      greenColor: const Color(0xff27AF4D),
      cartBottomBg: const Color(0xffF1F3FF),
      borderButtonWhite: const Color(0xffE5E5E5),
    );
  }

  ThemeData get themeData {
    var t = ThemeData.from(
      textTheme: (ThemeData.light()).textTheme,
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: primary,
        secondary: primary,
        background: whiteBg,
        surface: whiteBg,
        onBackground: whiteBg,
        onSurface: whiteBg,
        onError: Colors.red,
        onPrimary: primary,
        tertiary: whiteBg,
        onInverseSurface: whiteBg,
        tertiaryContainer: whiteBg,
        surfaceTint: whiteBg,
        surfaceVariant: whiteBg,
        onSecondary: primary,
        error: Colors.red,
      ),
    );
    return t.copyWith(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: Colors.transparent, cursorColor: primary),
      buttonTheme: ButtonThemeData(buttonColor: primary),
      highlightColor: primary,
    );
  }
}
