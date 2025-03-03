import 'package:google_fonts/google_fonts.dart';
import 'package:reqresz/config.dart';
import 'package:sizer/sizer.dart';

part 'scale.dart';

FontWeight thin = FontWeight.w100;
FontWeight extraLight = FontWeight.w200;
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.normal;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
FontWeight extraThickBold = FontWeight.bold;

//Jakarta font
TextStyle jakarta({double? fontsize, fontWeight}) =>
    GoogleFonts.plusJakartaSans(fontSize: fontsize, fontWeight: fontWeight);

class AppCss {
//Text Style jakarta extra bold
  TextStyle jakartaExtraBold70 =
      jakarta(fontWeight: extraBold, fontsize: FontSizes.f70.sp);
  TextStyle jakartaExtraBold65 =
      jakarta(fontWeight: extraBold, fontsize: FontSizes.f65.sp);
  TextStyle jakartaExtraBold60 =
      jakarta(fontWeight: extraBold, fontsize: FontSizes.f60.sp);
  TextStyle jakartaExtraBold40 =
      jakarta(fontWeight: extraBold, fontsize: FontSizes.f40.sp);
  TextStyle jakartaExtraBold20 =
      jakarta(fontWeight: extraBold, fontsize: FontSizes.f20.sp);
  TextStyle jakartaExtraBold25 =
      jakarta(fontWeight: extraBold, fontsize: FontSizes.f25.sp);
  TextStyle jakartaExtraBold30 =
      jakarta(fontWeight: extraBold, fontsize: FontSizes.f30.sp);

  //Text Style jakarta bold
  TextStyle jakartablack28 =
      jakarta(fontWeight: black, fontsize: FontSizes.f28.sp);
  TextStyle jakartablack24 =
      jakarta(fontWeight: black, fontsize: FontSizes.f24.sp);
  TextStyle jakartablack20 =
      jakarta(fontWeight: black, fontsize: FontSizes.f20.sp);
  TextStyle jakartablack18 =
      jakarta(fontWeight: black, fontsize: FontSizes.f18.sp);
  TextStyle jakartablack16 =
      jakarta(fontWeight: black, fontsize: FontSizes.f16.sp);
  TextStyle jakartablack14 =
      jakarta(fontWeight: black, fontsize: FontSizes.f14.sp);
  TextStyle jakartablack13 =
      jakarta(fontWeight: black, fontsize: FontSizes.f13.sp);

  //Text Style jakarta bold
  TextStyle jakartaExtraBold22 =
      jakarta(fontWeight: extraBold, fontsize: FontSizes.f22);
  TextStyle jakartaExtraBold18 =
      jakarta(fontWeight: extraBold, fontsize: FontSizes.f18);
  TextStyle jakartaExtraBold16 =
      jakarta(fontWeight: extraBold, fontsize: FontSizes.f16);
  TextStyle jakartaExtraBold14 =
      jakarta(fontWeight: extraBold, fontsize: FontSizes.f14);
  TextStyle jakartaExtraBold12 =
      jakarta(fontWeight: extraBold, fontsize: FontSizes.f12);

  //Text Style semi jakarta bold
  TextStyle jakartaBold50 =
      jakarta(fontWeight: bold, fontsize: FontSizes.f50.sp);
  TextStyle jakartaBold38 =
      jakarta(fontWeight: bold, fontsize: FontSizes.f38.sp);
  TextStyle jakartaBold35 =
      jakarta(fontWeight: bold, fontsize: FontSizes.f35.sp);
  TextStyle jakartaBold24 =
      jakarta(fontWeight: bold, fontsize: FontSizes.f24.sp);
  TextStyle jakartaBold20 =
      jakarta(fontWeight: bold, fontsize: FontSizes.f20.sp);
  TextStyle jakartaBold18 =
      jakarta(fontWeight: bold, fontsize: FontSizes.f18.sp);
  TextStyle jakartaBold16 =
      jakarta(fontWeight: bold, fontsize: FontSizes.f16.sp);
  TextStyle jakartaBold15 =
      jakarta(fontWeight: bold, fontsize: FontSizes.f15.sp);
  TextStyle jakartaBold17 =
      jakarta(fontWeight: bold, fontsize: FontSizes.f17.sp);
  TextStyle jakartaBold14 =
      jakarta(fontWeight: bold, fontsize: FontSizes.f14.sp);
  TextStyle jakartaBold12 =
      jakarta(fontWeight: bold, fontsize: FontSizes.f12.sp);
  TextStyle jakartaBold10 =
      jakarta(fontWeight: bold, fontsize: FontSizes.f10.sp);

  TextStyle jakartaSemiBold24 =
      jakarta(fontWeight: semiBold, fontsize: FontSizes.f24.sp);
  TextStyle jakartaSemiBold22 =
      jakarta(fontWeight: semiBold, fontsize: FontSizes.f22.sp);
  TextStyle jakartaSemiBold20 =
      jakarta(fontWeight: semiBold, fontsize: FontSizes.f20.sp);
  TextStyle jakartaSemiBold18 =
      jakarta(fontWeight: semiBold, fontsize: FontSizes.f18.sp);
  TextStyle jakartaSemiBold16 =
      jakarta(fontWeight: semiBold, fontsize: FontSizes.f16.sp);
  TextStyle jakartaSemiBold15 =
      jakarta(fontWeight: semiBold, fontsize: FontSizes.f15.sp);
  TextStyle jakartaSemiBold13 =
      jakarta(fontWeight: semiBold, fontsize: FontSizes.f13.sp);
  TextStyle jakartaSemiBold14 =
      jakarta(fontWeight: semiBold, fontsize: FontSizes.f14.sp);
  TextStyle jakartaSemiBold12 =
      jakarta(fontWeight: semiBold, fontsize: FontSizes.f12.sp);
  TextStyle jakartaSemiBold11 =
      jakarta(fontWeight: semiBold, fontsize: FontSizes.f11.sp);
  TextStyle jakartaSemiBold10 =
      jakarta(fontWeight: semiBold, fontsize: FontSizes.f10.sp);
  TextStyle jakartaSemiBold9 =
      jakarta(fontWeight: semiBold, fontsize: FontSizes.f9.sp);
  TextStyle jakartaSemiBold8 =
      jakarta(fontWeight: semiBold, fontsize: FontSizes.f8.sp);

  //Text Style jakarta medium
  TextStyle jakartaMedium28 =
      jakarta(fontWeight: medium, fontsize: FontSizes.f28.sp);
  TextStyle jakartaMedium22 =
      jakarta(fontWeight: medium, fontsize: FontSizes.f22.sp);
  TextStyle jakartaMedium20 =
      jakarta(fontWeight: medium, fontsize: FontSizes.f20.sp);
  TextStyle jakartaMedium18 =
      jakarta(fontWeight: medium, fontsize: FontSizes.f18.sp);
  TextStyle jakartaMedium16 =
      jakarta(fontWeight: medium, fontsize: FontSizes.f16.sp);
  TextStyle jakartaMedium15 =
      jakarta(fontWeight: medium, fontsize: FontSizes.f15.sp);
  TextStyle jakartaMedium14 =
      jakarta(fontWeight: medium, fontsize: FontSizes.f14.sp);
  TextStyle jakartaMedium13 =
      jakarta(fontWeight: medium, fontsize: FontSizes.f13.sp);
  TextStyle jakartaMedium12 =
      jakarta(fontWeight: medium, fontsize: FontSizes.f12.sp);
  TextStyle jakartaMedium11 =
      jakarta(fontWeight: medium, fontsize: FontSizes.f11.sp);
  TextStyle jakartaMedium10 =
      jakarta(fontWeight: medium, fontsize: FontSizes.f10.sp);
  TextStyle jakartaMedium9 =
      jakarta(fontWeight: medium, fontsize: FontSizes.f9.sp);
  TextStyle jakartaMedium8 =
      jakarta(fontWeight: medium, fontsize: FontSizes.f8.sp);

  //Text Style jakarta regular
  TextStyle jakartaRegular18 =
      jakarta(fontWeight: regular, fontsize: FontSizes.f18.sp);
  TextStyle jakartaRegular16 =
      jakarta(fontWeight: regular, fontsize: FontSizes.f16.sp);
  TextStyle jakartaRegular14 =
      jakarta(fontWeight: regular, fontsize: FontSizes.f14.sp);
  TextStyle jakartaRegular13 =
      jakarta(fontWeight: regular, fontsize: FontSizes.f13.sp);
  TextStyle jakartaRegular12 =
      jakarta(fontWeight: regular, fontsize: FontSizes.f12.sp);
  TextStyle jakartaRegular11 =
      jakarta(fontWeight: regular, fontsize: FontSizes.f11.sp);
  TextStyle jakartaRegular10 =
      jakarta(fontWeight: regular, fontsize: FontSizes.f10.sp);
  TextStyle jakartaRegular9 =
      jakarta(fontWeight: regular, fontsize: FontSizes.f9.sp);
  TextStyle jakartaRegular8 =
      jakarta(fontWeight: regular, fontsize: FontSizes.f8.sp);

  TextStyle jakartaLight16 =
      jakarta(fontWeight: light, fontsize: FontSizes.f16.sp);
  TextStyle jakartaLight14 =
      jakarta(fontWeight: light, fontsize: FontSizes.f14.sp);
  TextStyle jakartaLight12 =
      jakarta(fontWeight: light, fontsize: FontSizes.f12.sp);
}
