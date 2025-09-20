import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:semapay/Cubit/Task%20creation/task_creation_cubit.dart';
import 'package:semapay/UI/Screens/Exam/exam.dart';

import '../const.dart';
import '../widgets.dart';

class Book extends StatelessWidget {
  const Book({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
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
                    Gap(secondaryGap),
                    Row(
                      children: [
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
                                style: secondaryStyle.copyWith(
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Gap(secondaryGap),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border(
                              bottom: BorderSide(width: 1, color: Colors.white),
                            ),
                          ),
                          child: Container(
                            width: 101,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                top: BorderSide(width: 1, color: Colors.black),
                                left: BorderSide(width: 1, color: Colors.black),
                                right:
                                    BorderSide(width: 1, color: Colors.black),
                                bottom: BorderSide.none,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Page 54',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Gap(g1),
                        Icon(Icons.add),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.black,
                width: screenWidth(context),
                height: 1,
              ),
              Container(
                color: Colors.white,
                width: screenWidth(context),
                child: Column(
                  children: [
                    Gap(mainGap),
                    Padding(
                      padding: mainPadding,
                      child: MainButton(
                          onTap: () {
                            Navigator.push((context),
                                MaterialPageRoute(builder: (context) {
                              return Exam();
                            }));
                          },
                          borderSize: 1.5,
                          color: Colors.white,
                          borderColor: warningColor,
                          hasBothPadding: true,
                          child: Column(
                            children: [
                              Text(
                                'You have pending task!',
                                style: titleStyle.copyWith(color: warningColor),
                              ),
                              Gap(g1),
                              BlocBuilder<TaskCreationCubit, TaskCreationState>(
                                builder: (context, state) {
                                  int index = state.index;
                                  var task = state.tasks[index];
                                  return MainButton(
                                      hasBothPadding: true,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${task.name.isEmpty ? 'Task ${index + 1}' : task.name} ( ${task.book} )',
                                            style: secondaryStyle.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Reward:',
                                                style: secondaryStyle.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Gap(5),
                                              task.isAmount
                                                  ? Row(
                                                      children: [
                                                        jawaniCoin(15),
                                                        Gap(1),
                                                        Text(
                                                          task.amount
                                                              .toStringAsFixed(
                                                                  0),
                                                          style: secondaryStyle
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                      ],
                                                    )
                                                  : Image.asset(
                                                      task.giftCard,
                                                      width: 25,
                                                    ),
                                            ],
                                          ),
                                        ],
                                      ));
                                },
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: screenHeight(context) - 300,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          List<String> pages = [
                            'assets/images/book.png',
                            'assets/images/book_page_2.png',
                          ];
                          return Image.asset(pages[index]);
                        },
                        itemCount: 2,
                        loop: true,
                        index: 0,
                        viewportFraction: .97,
                        scale: .7,
                      ),
                    ),
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
