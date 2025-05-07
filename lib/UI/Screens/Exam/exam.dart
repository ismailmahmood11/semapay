import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:semapay/Cubit/Exam/exam_cubit.dart';
import 'package:semapay/List/exam.dart';
import 'package:semapay/UI/Screens/Exam/result.dart';

import '../../const.dart';
import '../../widgets.dart';

class Exam extends StatelessWidget {
  Exam({super.key});

  final _swiperController = SwiperController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: mainPadding,
                child: StudentNavigationBar(),
              ),
              Gap(mainGap),
              Padding(
                padding: mainPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Question ${context.read<ExamCubit>().state.index + 1}',
                      style: titleStyle,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        'End exam',
                        style: secondaryStyle.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(secondaryGap),
              BlocBuilder<ExamCubit, ExamState>(
                builder: (context, state) {
                  double progress = (state.index + 1) / examList.length;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0.0, end: progress),
                      duration: animationDuration,
                      // Smooth transition duration
                      builder: (context, animatedProgress, child) {
                        return LinearPercentIndicator(
                          width: screenWidth(context) - 20,
                          lineHeight: 15.0,
                          percent: animatedProgress,
                          barRadius: const Radius.circular(3),
                          progressColor: themeColor,
                        );
                      },
                    ),
                  );
                },
              ),
              Gap(secondaryGap),
              BlocListener<ExamCubit, ExamState>(
                listener: (context, state) {
                  _swiperController.move(state.index);
                },
                child: SizedBox(
                  width: screenWidth(context),
                  height: 288,
                  child: Swiper(
                    controller: _swiperController,
                    onIndexChanged: (index) =>
                        context.read<ExamCubit>().exam(index: index),
                    itemBuilder: (BuildContext context, int index) {
                      return MainButton(
                        height: 288,
                        hasBothPadding: true,
                        child: Center(
                          child: Text(
                            examList[index].question,
                            style: secondaryStyle.copyWith(color: Colors.black),
                          ),
                        ),
                      );
                    },
                    itemCount: examList.length,
                    loop: false,
                    index: 0,
                    viewportFraction: 0.8,
                    scale: 0.9,
                  ),
                ),
              ),
              Padding(
                padding: mainPadding,
                child: BlocBuilder<ExamCubit, ExamState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(secondaryGap),
                        Text(
                          'Options',
                          style: titleStyle,
                        ),
                        for (int i = 0;
                            i < examList[state.index].option.length;
                            i++)
                          Column(
                            children: [
                              Gap(secondaryGap),
                              MainButton(
                                onTap: () {
                                  context.read<ExamCubit>().exam(
                                        index:
                                            state.index == examList.length - 1
                                                ? state.index
                                                : state.index + 1,
                                        selectedOption: i,
                                      );
                                  if (state.index == examList.length - 1) {
                                    Navigator.push((context),
                                        MaterialPageRoute(builder: (context) {
                                      return Result();
                                    }));
                                  }
                                  for (var option
                                      in examList[state.index].option) {
                                    option.selectedOption =
                                        false; // Set all options' selectedOption to false
                                  }
                                  examList[state.index].selectedOptionIndex = i;
                                  examList[state.index]
                                          .option[i]
                                          .selectedOption =
                                      true; // Set the selected option to true
                                },
                                borderSize: 1.5,
                                borderColor: examList[state.index]
                                        .option[i]
                                        .selectedOption
                                    ? secondaryThemeColor
                                    : Colors.transparent,
                                height: 60,
                                hasBothPadding: true,
                                child: Center(
                                  child: Text(
                                    examList[state.index].option[i].option,
                                    style: secondaryStyle.copyWith(
                                      color: examList[state.index]
                                              .option[i]
                                              .selectedOption
                                          ? themeColor
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
