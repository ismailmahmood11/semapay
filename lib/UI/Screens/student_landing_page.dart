import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:semapay/Cubit/Balance/balance_cubit.dart';
import 'package:semapay/Cubit/Exam/exam_cubit.dart';
import 'package:semapay/Cubit/Task%20creation/task_creation_cubit.dart';
import 'package:semapay/UI/const.dart';

import '../../List/services_list.dart';
import '../widgets.dart';

class StudentLandingPage extends StatelessWidget {
  const StudentLandingPage({super.key});

  static const double buttonPadding = 11;
  static const double buttonPaddingService = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: mainPadding,
                child: Column(
                  children: [
                    StudentNavigationBar(),
                    Gap(mainGap),
                    BlocBuilder<BalanceCubit, BalanceState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CurrentBalance(
                              balance: state.studentBalance,
                              decimal: state.studentBalance,
                            ),
                            PendingBalance(
                              balance: state.pendingBalance,
                              decimal: 0,
                            ),
                          ],
                        );
                      },
                    ),
                    Gap(mainGap),
                  ],
                ),
              ),
              Cards(
                image: 'assets/images/student_card.png',
                images: [
                  'assets/Cards/card - 2.png',
                  'assets/Cards/card - 1.png',
                  'assets/Cards/card - 3.png',
                ],
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
                                  'Add Credits',
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
                    Text(
                      'Services',
                      style: titleStyle,
                    ),
                    Gap(secondaryGap),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // Number of columns
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 1.0, // Adjust for item size
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: studentServicesList.length,
                      // Number of items
                      itemBuilder: (context, index) {
                        return MainButton(
                            height: 100,
                            width: 110,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                studentServicesList[index].icon,
                                Gap(g1),
                                Text(
                                  studentServicesList[index].title,
                                  textAlign: TextAlign.center,
                                  style: secondaryStyle,
                                ),
                              ],
                            ));
                      },
                    ),
                    Gap(mainGap),
                    Text(
                      'Smart Contracts',
                      style: titleStyle,
                    ),
                    Gap(secondaryGap),
                    BlocBuilder<TaskCreationCubit, TaskCreationState>(
                      builder: (context, state) {
                        return state.tasks.isEmpty
                            ? MainButton(
                                hasBothPadding: true,
                                width: double.infinity,
                                child: Center(
                                    child: Text(
                                  'Nothing to show',
                                  style: secondaryStyle,
                                )))
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
                                        return SmartContractWidget(
                                            state: state,
                                            i: i,
                                            remainingDate: remainingDate);
                                      });
                                },
                              );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
