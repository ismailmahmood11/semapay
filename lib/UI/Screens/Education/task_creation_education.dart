import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:semapay/Cubit/Balance/balance_cubit.dart';
import 'package:semapay/UI/Screens/Education/add_task_education.dart';

import '../../../Cubit/Navigation/navigation_cubit.dart';
import '../../../Cubit/Task creation/task_creation_cubit.dart';
import '../../const.dart';
import '../../widgets.dart';

class TaskCreationEducation extends StatelessWidget {
  TaskCreationEducation({super.key});

  final List<Map<String, String>> books = [
    {
      'image': 'assets/images/Books/science.png',
      'name': 'Science',
    },
    {
      'image': 'assets/images/Books/maths.png',
      'name': 'Maths',
    },
    {
      'image': 'assets/images/Books/islamic.png',
      'name': 'Islamic',
    },
    {
      'image': 'assets/images/Books/arabic.png',
      'name': 'Arabic',
    },
  ];

  final String xboxImage = 'assets/images/Gift Cards/xbox.png';
  final String psImage = 'assets/images/Gift Cards/ps.png';
  final String amazonImage = 'assets/images/Gift Cards/amazon.png';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: BlocBuilder<TaskCreationCubit, TaskCreationState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: mainPadding,
                      child: Column(
                        children: [
                          MainNavigationBar(),
                          Gap(secondaryGap),
                          GestureDetector(
                            onTap: () => context
                                .read<NavigationCubit>()
                                .page(AddTaskEducation()),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  size: 15,
                                ),
                                Gap(5),
                                Text(
                                  'Back',
                                  style: secondaryStyle.copyWith(
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Gap(secondaryGap),
                          MainTextField(
                            initialValue:
                                context.watch<TaskCreationCubit>().state.name,
                            onChanged: (value) {
                              context
                                  .read<TaskCreationCubit>()
                                  .updateTask(name: value);
                            },
                            title: 'Task Name',
                            hint: 'Test 1',
                          ),
                          Gap(secondaryGap),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MainButton(
                                onTap: () {
                                  context
                                      .read<TaskCreationCubit>()
                                      .updateTask(isAmount: true);
                                },
                                borderColor: state.isAmount == true
                                    ? themeColor
                                    : Colors.transparent,
                                borderSize: 1.5,
                                width: (screenWidth(context) / 2) - 25,
                                child: Center(
                                  child: Text(
                                    'Amount',
                                    style: titleStyle.copyWith(
                                        color: state.isAmount
                                            ? themeColor
                                            : textColor),
                                  ),
                                ),
                              ),
                              MainButton(
                                onTap: () {
                                  context
                                      .read<TaskCreationCubit>()
                                      .updateTask(isAmount: false);
                                },
                                borderColor: state.isAmount
                                    ? Colors.transparent
                                    : themeColor,
                                borderSize: 1.5,
                                width: (screenWidth(context) / 2) - 25,
                                child: Center(
                                  child: Text(
                                    'Gift Cards',
                                    style: titleStyle.copyWith(
                                      color: state.isAmount
                                          ? textColor
                                          : themeColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gap(secondaryGap),
                        ],
                      ),
                    ),
                    state.isAmount
                        ? Padding(
                            padding: mainPadding,
                            child: MainTextField(
                              initialValue: context
                                  .watch<TaskCreationCubit>()
                                  .state
                                  .amount
                                  .toString(),
                              // Convert double to String
                              onChanged: (value) {
                                double parsedValue = double.tryParse(value) ??
                                    0; // Ensure conversion to double
                                context
                                    .read<TaskCreationCubit>()
                                    .updateTask(amount: parsedValue);
                              },
                              isAmount: true,
                              title: 'Amount',
                              hint: '10',
                            ),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                MainButton(
                                  onTap: () => context
                                      .read<TaskCreationCubit>()
                                      .updateTask(giftCard: psImage),
                                  borderSize: 4,
                                  borderColor: state.giftCard == psImage
                                      ? Color.lerp(secondaryThemeColor,
                                          Colors.white, .4)!
                                      : Colors.transparent,
                                  outsideLeftPadding: 20,
                                  hasPadding: false,
                                  width: 163,
                                  height: 111,
                                  child: Image.asset(
                                    psImage,
                                    fit: imageFit,
                                  ),
                                ),
                                MainButton(
                                  onTap: () => context
                                      .read<TaskCreationCubit>()
                                      .updateTask(giftCard: xboxImage),
                                  borderSize: 4,
                                  borderColor: state.giftCard == xboxImage
                                      ? Color.lerp(secondaryThemeColor,
                                          Colors.white, .4)!
                                      : Colors.transparent,
                                  outsideLeftPadding: 15,
                                  hasPadding: false,
                                  width: 163,
                                  height: 111,
                                  child: Image.asset(
                                    xboxImage,
                                    fit: imageFit,
                                  ),
                                ),
                                MainButton(
                                  onTap: () => context
                                      .read<TaskCreationCubit>()
                                      .updateTask(giftCard: amazonImage),
                                  borderSize: 4,
                                  borderColor: state.giftCard == amazonImage
                                      ? Color.lerp(secondaryThemeColor,
                                          Colors.white, .4)!
                                      : Colors.transparent,
                                  outsideLeftPadding: 15,
                                  outsideRightPadding: 20,
                                  hasPadding: false,
                                  width: 163,
                                  height: 111,
                                  child: Image.asset(
                                    amazonImage,
                                    fit: imageFit,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    Padding(
                      padding: mainPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(secondaryGap),
                          Text(
                            'Due Date',
                            style: titleStyle,
                          ),
                          Gap(childGap),
                          MainDatePicker(
                            state: state,
                          ),
                          Gap(secondaryGap),
                          Text(
                            'Book (Grade 9)',
                            style: titleStyle,
                          ),
                          Gap(childGap),
                          Wrap(
                            children: [
                              for (int i = 0; i < books.length; i++)
                                BlocBuilder<BalanceCubit, BalanceState>(
                                  builder: (context, balance) {
                                    return MainBookCard(
                                      onTap: () {
                                        context
                                            .read<TaskCreationCubit>()
                                            .addTask(
                                              Task(
                                                name: state.name,
                                                dueDate: state.dueDate,
                                                amount: state.isAmount
                                                    ? state.amount == 0
                                                        ? 10
                                                        : state.amount
                                                    : 100,
                                                giftCard: state.giftCard,
                                                book: books[i]['name']!,
                                                isAmount: state.isAmount,
                                              ),
                                            );

                                        context.read<BalanceCubit>().balance(
                                              fatherBalance:
                                                  balance.fatherBalance -
                                                      (state.isAmount
                                                          ? state.amount == 0
                                                              ? 10
                                                              : state.amount
                                                          : 100),
                                              pendingBalance:
                                                  balance.pendingBalance +
                                                      (state.isAmount
                                                          ? state.amount == 0
                                                              ? 10
                                                              : state.amount
                                                          : 100),
                                            );
                                        context
                                            .read<TaskCreationCubit>()
                                            .resetTask();
                                        context
                                            .read<NavigationCubit>()
                                            .page(AddTaskEducation());
                                      },
                                      image: books[i]['image']!,
                                      title: books[i]['name']!,
                                    );
                                  },
                                ),
                            ],
                          ),
                          Gap(bottomGap)
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
