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
const Color themeColor = Color(0xff003757);
const Color backgroundColor = Color(0xffFAFAFA);
const Color secondaryThemeColor = Color(0xff1A7EAF);
const Color nonFocusedColor = Color(0xff969696);
const Color buttonColor = Color(0x0F003757);
const Color warningColor = Color(0xffFEA025);

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

Widget saudiRiyal(double? size) {
  return Image.asset(
    'assets/images/Saudi riyal.png',
    width: size ?? 25,
  );
}
