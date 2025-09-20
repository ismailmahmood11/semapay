import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:semapay/Cubit/Balance/balance_cubit.dart';
import 'package:semapay/Cubit/Exam/exam_cubit.dart';
import 'package:semapay/Cubit/Task%20creation/task_creation_cubit.dart';
import 'package:semapay/UI/const.dart';

import '../home_page.dart';
import '../widgets.dart';

class KidsLandingPage extends StatelessWidget {
  const KidsLandingPage({super.key});

  static const double buttonPadding = 15;
  static const double buttonPaddingService = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/kids-background.png',
            fit: imageFit,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(mainGap * 4),
                Padding(
                  padding: mainPadding,
                  child: Column(
                    children: [
                      MainButton(
                        customHorizontalPadding: 20,
                        customVerticalPadding: 20,
                        hasBothPadding: true,
                        hasShadow: true,
                        borderRadius: kidsBorderRadius,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Gap(mainGap),
                            GestureDetector(
                              onTap: () => Navigator.pushReplacement((context),
                                  MaterialPageRoute(builder: (context) {
                                return HomePage();
                              })),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    height: 100,
                                    width: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                        'assets/images/Students/person 3.png',
                                        fit: imageFit,
                                      ),
                                    ),
                                  ),
                                  Gap(secondaryGap),
                                  Text(
                                    'SAUD',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gap(secondaryGap),
                            BlocBuilder<BalanceCubit, BalanceState>(
                              builder: (context, state) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: MainButton(
                                        customHorizontalPadding: 20,
                                        customVerticalPadding: 20,
                                        hasBothPadding: true,
                                        hasShadow: true,
                                        color: kidsColor2,
                                        borderRadius: kidsBorderRadius,
                                        child: CurrentBalance(
                                          balance: state.studentBalance,
                                          decimal: state.studentBalance,
                                        ),
                                      ),
                                    ),
                                    Gap(15),
                                    Flexible(
                                      child: MainButton(
                                        customHorizontalPadding: 10,
                                        customVerticalPadding: 20,
                                        hasBothPadding: true,
                                        hasShadow: true,
                                        color: kidsColor1,
                                        borderRadius: kidsBorderRadius,
                                        child: Center(
                                          child: PendingBalance(
                                            balance: state.pendingBalance,
                                            decimal: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            Gap(15),
                            MainButton(
                              customHorizontalPadding: 20,
                              customVerticalPadding: 20,
                              hasBothPadding: true,
                              hasShadow: true,
                              borderRadius: kidsBorderRadius,
                              width: double.infinity,
                              color: kidsColor3,
                              child: BlocBuilder<TaskCreationCubit,
                                  TaskCreationState>(
                                builder: (context, state) {
                                  return Column(
                                    children: [
                                      Text('Total Tasks', style: titleStyle),
                                      Text(
                                        state.tasks.length.toString(),
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Gap(mainGap),
                          ],
                        ),
                      ),
                      Gap(mainGap),
                    ],
                  ),
                ),
                Padding(
                  padding: mainPadding,
                  child: MainButton(
                      color: Colors.white,
                      customHorizontalPadding: 20,
                      customVerticalPadding: 20,
                      hasBothPadding: true,
                      hasShadow: true,
                      borderRadius: kidsBorderRadius,
                      child: Image.asset(
                        'assets/Cards/card - 1.png',
                      )),
                ),
                Gap(mainGap),
                MainButton(
                  width: double.infinity,
                  isCustomBorderRadius: true,
                  borderRadiusTopLeft: kidsBorderRadius,
                  borderRadiusTopRight: kidsBorderRadius,
                  hasBothPadding: true,
                  color: Colors.white,
                  customVerticalPadding: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Services',
                        style: titleStyle,
                      ),
                      Gap(secondaryGap),
                      KidsServices(),
                      Gap(mainGap),
                      Text(
                        'Smart Contracts',
                        style: titleStyle,
                      ),
                      BlocBuilder<TaskCreationCubit, TaskCreationState>(
                        builder: (context, state) {
                          return state.tasks.isEmpty
                              ? Column(
                                  children: [
                                    Gap(mainGap),
                                    MainButton(
                                        hasBothPadding: true,
                                        width: double.infinity,
                                        borderRadius: kidsBorderRadius,
                                        borderSize: 1,
                                        borderColor: themeColor,
                                        color: Colors.white,
                                        child: Center(
                                            child: Text(
                                          'Nothing to show',
                                          style: titleStyle.copyWith(
                                              color: themeColor),
                                        ))),
                                    Gap(mainGap),
                                  ],
                                )
                              : BlocBuilder<ExamCubit, ExamState>(
                                  builder: (context, exam) {
                                    return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: state.tasks.length,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, i) {
                                          // bool isIndexOne = (i == 0);
                                          int remainingDate = DateTime.now()
                                                  .difference(
                                                      state.tasks[i].dueDate)
                                                  .inDays
                                                  .abs() +
                                              1;
                                          return KidsSmartContractWidget(
                                              state: state,
                                              i: i,
                                              remainingDate: remainingDate);
                                        });
                                  },
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
