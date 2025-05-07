import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:semapay/Cubit/Navigation/navigation_cubit.dart';
import 'package:semapay/Cubit/Task%20creation/task_creation_cubit.dart';
import 'package:semapay/UI/Screens/Education/select_student.dart';
import 'package:semapay/UI/Screens/Education/task_creation_education.dart';

import '../../../List/student_list.dart';
import '../../const.dart';
import '../../widgets.dart';
import 'edit_task_education.dart';

class AddTaskEducation extends StatelessWidget {
  const AddTaskEducation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: mainPadding,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainNavigationBar(),
                  Gap(secondaryGap),
                  GestureDetector(
                    onTap: () => context
                        .read<NavigationCubit>()
                        .page(SelectStudentEducation()),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          size: 15,
                        ),
                        Gap(5),
                        Text(
                          'Back',
                          style: secondaryStyle.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Gap(secondaryGap),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      currentStudentsList[0]['Image']!,
                      width: 50,
                      fit: imageFit,
                    ),
                  ),
                  Gap(secondaryGap),
                  Text(
                    'Add Task',
                    style: titleStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: secondaryGap),
                    child: MainButton(
                      onTap: () => context
                          .read<NavigationCubit>()
                          .page(TaskCreationEducation()),
                      color: themeColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_circle_outline,
                            color: Colors.white,
                            size: 20,
                          ),
                          Gap(g1),
                          Text(
                            'Add Task',
                            textAlign: TextAlign.center,
                            style: titleStyle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocBuilder<TaskCreationCubit, TaskCreationState>(
                    builder: (context, state) {
                      return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),

                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 1.0, // Adjust for item size
                        ),
                        shrinkWrap: true,
                        itemCount: state.tasks.length,
                        // Number of items
                        itemBuilder: (context, i) {
                          final task = state.tasks[i];

                          return GestureDetector(
                            onTap: () {
                              // Start editing with selected task
                              context.read<TaskCreationCubit>().startEditing(i);

                              // Navigate to edit screen
                              context
                                  .read<NavigationCubit>()
                                  .page(EditTaskEducation());
                            },
                            child: TaskCard(
                              giftCard: task.giftCard,
                              isAmount: task.isAmount,
                              name: task.name.isEmpty
                                  ? 'Task ${i + 1}'
                                  : task.name,
                              book: task.book,
                              amount: task.amount.toInt(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Gap(bottomGap),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
