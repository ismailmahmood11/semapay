import 'package:flutter/material.dart';

//Icon Size
double iconSize = 30;

//Font Style
TextStyle titleStyle = TextStyle(
  fontSize: mainFontSize,
  fontWeight: FontWeight.bold,
  color: textColor,
);

TextStyle secondaryStyle = TextStyle(
  color: themeColor,
  fontSize: secondaryFontSize,
  fontWeight: FontWeight.w500,
);

TextStyle studentStyle = TextStyle(
  color: Colors.white,
  fontSize: mainFontSize,
  fontWeight: FontWeight.bold,
);

//Text Size
const double mainFontSize = 14;
const double secondaryFontSize = 12.5;
const double heading = 70;
const double h1 = 40;
const double h2 = 28;
const double h3 = 24;
const double h5 = 15;
const double p = 18;

//Color
const Color textColor = Color(0xff676767);

const Color themeColor = Color(0xff6528B6);
const Color backgroundColor = Color(0xffFAFAFA);
const Color secondaryThemeColor = Color(0xffA867FF);
const Color nonFocusedColor = Color(0xff969696);
const Color buttonColor = Color(0xffECEBF0);
const Color warningColor = Color(0xffFEA025);
//Kids color
const Color kidsColor1 = Color(0xffFBE8B3);
const Color kidsColor2 = Color(0xffCDFAD2);
const Color kidsColor3 = Color(0xffB5E3FF);

//Fit
const BoxFit fit = BoxFit.scaleDown;
const BoxFit imageFit = BoxFit.cover;

//Paddings
double p1 = 26;
double p2 = 15;
double p3 = 10;
EdgeInsets mainPadding = EdgeInsets.symmetric(horizontal: 20);

//Gap
const double mainGap = 27;
const double secondaryGap = 17;
const double childGap = 10;
const double bottomGap = 120;
const double g1 = 10;
const double g2 = 20;
const double g3 = 30;
const double g4 = 40;
const double g5 = 50;
const double g10 = 100;
const double g15 = 150;
const double g20 = 200;
const double kidsBorderRadius = 30;

//Animation Duration
const Duration animationDuration = Duration(milliseconds: 300);

//Screens

String mobile = 'mobile';
String desktop = 'desktop';
String laptop = 'laptop';

//Logo

String logo = 'assets/images/logo/semanoor_logo.png';
String logoBlack = 'assets/images/logo/semanoor_logo_black.png';

//Screen Size

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

//Saudi Riyal

Widget jawaniCoin(double? size) {
  return Image.asset(
    'assets/images/Saudi riyal.png',
    width: size ?? 25,
  );
}

Widget saudiRiyal(double? size) {
  return Image.asset(
    'assets/images/Saudi riyal icon.png',
    width: size ?? 25,
  );
}

//Format Number

// String formatBalance(num balance) {
//   final formatter = NumberFormat.compact();
//
//   return formatter.format(balance).toLowerCase();
// }

String formatBalance(num number) {
  if (number < 1000) {
    return number.toStringAsFixed(0);
  }

  if (number >= 1000000000) {
    // Use integer division '~/' to get rid of the decimal part
    return '${number ~/ 1000000000}b';
  }
  if (number >= 1000000) {
    return '${number ~/ 1000000}m';
  }
  if (number >= 1000) {
    return '${number ~/ 1000}k';
  }

  return number.toStringAsFixed(0);
}
