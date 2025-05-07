import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:semapay/Cubit/Balance/balance_cubit.dart';
import 'package:semapay/Cubit/Navigation/navigation_cubit.dart';
import 'package:semapay/UI/Screens/Education/add_task_education.dart';
import 'package:semapay/UI/Screens/add_money.dart';
import 'package:semapay/UI/Screens/services.dart';
import 'package:semapay/UI/Screens/students.dart';
import 'package:semapay/UI/const.dart';

import '../../List/student_list.dart';
import '../widgets.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  static const double buttonPadding = 15;
  static const double buttonPaddingService = 30;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: mainPadding,
              child: Column(
                children: [
                  MainNavigationBar(),
                  Gap(mainGap),
                  BlocBuilder<BalanceCubit, BalanceState>(
                    builder: (context, state) {
                      return CurrentBalance(
                        balance: state.fatherBalance,
                        decimal: state.fatherBalance,
                      );
                    },
                  ),
                  Gap(mainGap),
                ],
              ),
            ),
            Cards(
              image: 'assets/images/card.png',
            ),
            Gap(mainGap),
            Padding(
              padding: mainPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainButton(
                        onTap: () =>
                            context.read<NavigationCubit>().page(AddMoney()),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: buttonPadding,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.add,
                                color: themeColor,
                              ),
                              Gap(3),
                              Text(
                                'Add money',
                                style: secondaryStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      MainButton(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: buttonPadding,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.event_note_rounded,
                                color: themeColor,
                              ),
                              Gap(3),
                              Text(
                                'Transaction',
                                style: secondaryStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      MainButton(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: buttonPadding,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: themeColor,
                              ),
                              Gap(3),
                              Text(
                                'Info',
                                style: secondaryStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(mainGap),
                  Text('Services', style: titleStyle),
                  Gap(secondaryGap),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainButton(
                          height: 100,
                          width: 110,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HugeIcon(
                                icon: HugeIcons
                                    .strokeRoundedArrowDataTransferHorizontal,
                                color: themeColor,
                                size: 30,
                              ),
                              Gap(g1),
                              Text(
                                'Transfer',
                                style: secondaryStyle,
                              ),
                            ],
                          )),
                      MainButton(
                          height: 100,
                          width: 110,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Gap(5),
                              Icon(
                                Icons.u_turn_left_rounded,
                                color: themeColor,
                                size: 25,
                              ),
                              Gap(g1),
                              Text(
                                'Request',
                                style: secondaryStyle,
                              ),
                            ],
                          )),
                      MainButton(
                          onTap: () =>
                              context.read<NavigationCubit>().page(Services()),
                          height: 100,
                          width: 110,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HugeIcon(
                                icon: HugeIcons.strokeRoundedMoreHorizontal,
                                color: themeColor,
                                size: 40,
                              ),
                              Gap(2),
                              Text(
                                'More',
                                style: secondaryStyle,
                              ),
                            ],
                          )),
                    ],
                  ),
                  Gap(mainGap),
                  Text('Semanoor', style: titleStyle),
                  Gap(secondaryGap),
                  MainButton(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SEMA',
                            style: TextStyle(
                              color: themeColor,
                              fontWeight: FontWeight.bold,
                              fontSize: mainFontSize,
                              letterSpacing: -.6,
                            ),
                          ),
                          Text(
                            'NOOR',
                            style: TextStyle(
                              color: Color(0xff0073A7),
                              fontWeight: FontWeight.bold,
                              fontSize: mainFontSize,
                              letterSpacing: -.6,
                            ),
                          ),
                        ],
                      )),
                  Gap(mainGap),
                  Row(
                    children: [
                      Text('Students', style: titleStyle),
                      Gap(5),
                      GestureDetector(
                        onTap: () {
                          context.read<NavigationCubit>().page(Students());
                        },
                        child: Icon(
                          Icons.add_circle_outline_rounded,
                          color: textColor,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                  Gap(secondaryGap),
                  BlocBuilder<NavigationCubit, NavigationState>(
                    builder: (context, state) {
                      if (state.studentAdded) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            context
                                .read<NavigationCubit>()
                                .page(AddTaskEducation());
                          },
                          child: Row(
                            children: [
                              for (int i = 0;
                                  i < currentStudentsList.length;
                                  i++)
                                IgnorePointer(
                                  ignoring: true,
                                  child: StudentCard(
                                    isClickable: false,
                                    students: currentStudentsList,
                                    index: i,
                                  ),
                                ),
                            ],
                          ),
                        );
                      } else {
                        return MainButton(
                          onTap: () {
                            context.read<NavigationCubit>().page(Students());
                          },
                          height: 100,
                          width: double.infinity,
                          child: Center(
                              child: Text(
                            'Add students to show here',
                            style: secondaryStyle,
                          )),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Gap(bottomGap)
          ],
        ),
      ),
    );
  }
}
