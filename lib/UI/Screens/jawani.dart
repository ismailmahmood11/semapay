import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:semapay/List/services_list.dart';
import 'package:semapay/UI/const.dart';

import '../widgets.dart';

class Jawani extends StatelessWidget {
  const Jawani({super.key});

  static const double buttonPadding = 15;
  static const double buttonPaddingService = 30;

  @override
  Widget build(BuildContext context) {
    final semanoorSmartBookList = getSemanoorSmartBookList(context);

    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: mainPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainNavigationBar(),
                Gap(mainGap),
                Text(
                  'Jawani',
                  style: titleStyle,
                ),
                Gap(secondaryGap),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1.0, // Adjust for item size
                  ),
                  shrinkWrap: true,
                  itemCount: semanoorSmartBookList.length,
                  // Number of items
                  itemBuilder: (context, index) {
                    return MainButton(
                        onTap: semanoorSmartBookList[index].onTap,
                        height: 100,
                        width: 110,
                        color: Colors.white,
                        shadowColor: Colors.black.withValues(alpha: .8),
                        shadow: 6,
                        hasShadow: true,
                        // child: semanoorSmartBookList[index].onlyString
                        // ? Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Text(
                        //         'SEMA',
                        //         style: TextStyle(
                        //           color: themeColor,
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: mainFontSize,
                        //           letterSpacing: -.6,
                        //         ),
                        //       ),
                        //       Text(
                        //         'NOOR',
                        //         style: TextStyle(
                        //           color: secondaryThemeColor,
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: mainFontSize,
                        //           letterSpacing: -.6,
                        //         ),
                        //       ),
                        //     ],
                        //   )
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            semanoorSmartBookList[index].icon,
                            Gap(g1),
                            Text(
                              semanoorSmartBookList[index].title,
                              textAlign: TextAlign.center,
                              style:
                                  secondaryStyle.copyWith(color: Colors.black),
                            ),
                          ],
                        ));
                  },
                ),
                Gap(bottomGap),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
