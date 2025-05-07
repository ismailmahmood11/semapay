import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:semapay/Cubit/Balance/balance_cubit.dart';
import 'package:semapay/Cubit/Exam/exam_cubit.dart';
import 'package:semapay/Cubit/Task%20creation/task_creation_cubit.dart';
import 'package:semapay/List/exam.dart';
import 'package:semapay/UI/Screens/student_landing_page.dart';

import '../../const.dart';
import '../../widgets.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: mainPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StudentNavigationBar(),
                Gap(secondaryGap),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 15,
                      ),
                      Gap(5),
                      Text(
                        'Home',
                        style: secondaryStyle.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Gap(secondaryGap),
                Text(
                  'You scored 94 out of 100 percentage! 🎉 Congratulations on earning your reward!',
                  style: titleStyle.copyWith(color: Colors.green),
                ),
                Gap(mainGap),
                BlocBuilder<ExamCubit, ExamState>(
                  builder: (context, state) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Question ${index + 1}',
                              style: titleStyle,
                            ),
                            Gap(secondaryGap),
                            MainButton(
                              height: 288,
                              hasBothPadding: true,
                              child: Center(
                                child: Text(
                                  examList[index].question,
                                  style: secondaryStyle.copyWith(
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            Gap(secondaryGap),
                            Text(
                              'Correct answer',
                              style: titleStyle,
                            ),
                            Gap(secondaryGap),
                            MainButton(
                              onTap: () {},
                              borderSize: 1.5,
                              borderColor: themeColor,
                              height: 60,
                              hasBothPadding: true,
                              child: Center(
                                child: Text(
                                  examList[index].correctOption,
                                  style: secondaryStyle.copyWith(
                                    color: themeColor,
                                  ),
                                ),
                              ),
                            ),
                            Gap(secondaryGap),
                            Text(
                              'Your answer',
                              style: titleStyle,
                            ),
                            Gap(secondaryGap),
                            MainButton(
                              onTap: () {},
                              borderSize: 1.5,
                              borderColor: examList[index].correctOption ==
                                      examList[index]
                                          .option[examList[index]
                                                  .selectedOptionIndex ??
                                              0]
                                          .option
                                  ? Colors.green
                                  : Colors.red,
                              height: 60,
                              hasBothPadding: true,
                              child: Center(
                                child: Text(
                                  examList[index]
                                      .option[
                                          examList[index].selectedOptionIndex ??
                                              0]
                                      .option,
                                  style: secondaryStyle.copyWith(
                                    color: themeColor,
                                  ),
                                ),
                              ),
                            ),
                            Gap(mainGap),
                          ],
                        );
                      },
                      itemCount: examList.length,
                    );
                  },
                ),
                BlocBuilder<BalanceCubit, BalanceState>(
                  builder: (context, balance) {
                    return BlocBuilder<TaskCreationCubit, TaskCreationState>(
                      builder: (context, state) {
                        return MainButton(
                            customVerticalPadding: 15,
                            onTap: () {
                              Navigator.pushReplacement((context),
                                  MaterialPageRoute(builder: (context) {
                                return StudentLandingPage();
                              }));
                              context
                                  .read<ExamCubit>()
                                  .addCompletedIndex(state.index);

                              context.read<BalanceCubit>().balance(
                                    pendingBalance: balance.pendingBalance -
                                        state.tasks[state.index].amount,
                                    studentBalance: balance.studentBalance +
                                        state.tasks[state.index].amount,
                                  );
                            },
                            color: themeColor,
                            child: Center(
                              child: Text(
                                'Continue',
                                style: titleStyle.copyWith(color: Colors.white),
                              ),
                            ));
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
