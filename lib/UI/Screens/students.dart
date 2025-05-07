import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:semapay/Cubit/Navigation/navigation_cubit.dart';
import 'package:semapay/UI/Screens/landing_page.dart';
import 'package:semapay/UI/const.dart';
import 'package:semapay/UI/widgets.dart';

import '../../List/student_list.dart';

class Students extends StatelessWidget {
  const Students({super.key});

  @override
  Widget build(BuildContext context) {
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
                  'Add Students',
                  style: titleStyle,
                ),
                Gap(secondaryGap),
                Wrap(
                  children: [
                    for (int i = 0; i < studentsList.length; i++)
                      StudentCard(
                        students: studentsList,
                        index: i,
                      ),
                    MainButton(
                        onTap: () => context
                            .read<NavigationCubit>()
                            .addStudents(LandingPage(), true),
                        height: 100,
                        width: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Gap(5),
                            Icon(
                              Icons.add_circle_outline,
                              color: themeColor,
                              size: 25,
                            ),
                            Gap(g1),
                            Text(
                              'Add',
                              style: secondaryStyle,
                            ),
                          ],
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
