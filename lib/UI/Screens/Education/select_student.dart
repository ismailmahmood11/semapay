import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:semapay/Cubit/Navigation/navigation_cubit.dart';
import 'package:semapay/UI/Screens/Education/add_task_education.dart';

import '../../../List/student_list.dart';
import '../../const.dart';
import '../../widgets.dart';

class SelectStudentEducation extends StatelessWidget {
  const SelectStudentEducation({super.key});

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
                  'Select Student',
                  style: titleStyle,
                ),
                Gap(secondaryGap),
                Wrap(
                  children: [
                    for (int i = 0; i < currentStudentsList.length; i++)
                      GestureDetector(
                        onTap: () => context
                            .read<NavigationCubit>()
                            .page(AddTaskEducation()),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: mainGap),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  currentStudentsList[i]['Image']!,
                                  width: 60,
                                  fit: imageFit,
                                ),
                              ),
                              Gap(mainGap),
                              Text(
                                "${currentStudentsList[i]['Name']!} ${currentStudentsList[i]['Grade']!}",
                                style: titleStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
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
