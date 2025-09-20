import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:semapay/Cubit/Exam/exam_cubit.dart';
import 'package:semapay/Cubit/Navigation/navigation_cubit.dart';
import 'package:semapay/Cubit/Task%20creation/task_creation_cubit.dart';
import 'package:semapay/UI/Screens/jawani.dart';
import 'package:semapay/UI/Screens/kids_landing_page.dart';
import 'package:semapay/UI/Screens/services.dart';
import 'package:semapay/UI/Screens/students.dart';
import 'package:semapay/UI/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../List/services_list.dart';
import 'Screens/book.dart';
import 'Screens/landing_page.dart';
import 'Screens/student_landing_page.dart';
import 'const.dart';

//Student Card
//ignore: must_be_immutable
class StudentCard extends StatefulWidget {
  StudentCard({
    super.key,
    required this.students,
    required this.index,
    this.isClickable = true,
    this.isClicked = false,
  });

  final List<Map<String, String>> students;
  final int index;
  bool isClicked;
  final bool isClickable;

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isClicked = !widget.isClicked;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0, bottom: secondaryGap),
        child: Stack(
          children: [
            Image.asset(
              widget.students[widget.index]['Image']!,
              width: 105,
              fit: imageFit,
            ),
            Positioned(
              bottom: 0,
              child: AnimatedContainer(
                duration: animationDuration,
                width: 105,
                height: 30,
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x00012538), // Transparent dark blue
                      Color(0xC9012438), // Dark blue with opacity
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(8),
                    ),
                  ),
                ),
                child: widget.isClickable
                    ? Row(
                        // mainAxisAlignment: widget.isClicked
                        //     ? MainAxisAlignment.spaceBetween
                        //     : MainAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        // Ensure it doesn't take full width
                        children: [
                          AnimatedPadding(
                            padding: EdgeInsets.only(
                                right: widget.isClicked ? 10.0 : 0.0),
                            duration: Duration(milliseconds: 200),
                            child: Text(
                              widget.students[widget.index]['Name']!,
                              textAlign: TextAlign.center,
                              style: studentStyle,
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: widget.isClicked ? 1 : 0.0,
                            duration: Duration(milliseconds: 200),
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.greenAccent,
                              size: 17,
                              key: ValueKey<bool>(widget.isClicked),
                            ),
                          ),
                        ],
                      )
                    : Text(
                        widget.students[widget.index]['Name']!,
                        textAlign: TextAlign.center,
                        style: studentStyle,
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Bottom Bar
class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 20,
      right: 20,
      child: Container(
        height: 70,
        // width: MediaQuery.of(context).size.width - 40,
        decoration: ShapeDecoration(
          color: Color(0xfffafafa),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x28000000),
              blurRadius: 18.60,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: mainPadding,
          child: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, currentPage) {
              Widget page = currentPage.page;
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () =>
                        context.read<NavigationCubit>().page(LandingPage()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedHome06,
                          color: page is LandingPage
                              ? themeColor
                              : nonFocusedColor,
                          size: 30,
                        ),
                        Text(
                          'Home',
                          style: secondaryStyle.copyWith(
                            fontWeight: page is LandingPage
                                ? FontWeight.bold
                                : FontWeight.w500,
                            letterSpacing: page is LandingPage ? -.3 : null,
                            color: page is LandingPage ? themeColor : textColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        context.read<NavigationCubit>().page(Students()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedStudents,
                          color:
                              page is Students ? themeColor : nonFocusedColor,
                          size: 30,
                        ),
                        Text(
                          'Students',
                          style: secondaryStyle.copyWith(
                              fontWeight: page is Students
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              letterSpacing: page is Students ? -.3 : null,
                              color: page is Students ? themeColor : textColor),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        context.read<NavigationCubit>().page(Services()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.work_outline,
                          color:
                              page is Services ? themeColor : nonFocusedColor,
                          size: 30,
                        ),
                        Text(
                          'Services',
                          style: secondaryStyle.copyWith(
                              fontWeight: page is Services
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              letterSpacing: page is Services ? -.3 : null,
                              color: page is Services ? themeColor : textColor),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.read<NavigationCubit>().page(Jawani()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          page is! LandingPage &&
                                  page is! Students &&
                                  page is! Services
                              ? 'assets/images/bee_selected.png'
                              : 'assets/images/bee.png',
                          height: 30,
                        ),
                        Text(
                          'Jawani',
                          style: secondaryStyle.copyWith(
                              fontWeight: page is! LandingPage &&
                                      page is! Students &&
                                      page is! Services
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              letterSpacing: page is! LandingPage &&
                                      page is! Students &&
                                      page is! Services
                                  ? -.3
                                  : null,
                              color: page is! LandingPage &&
                                      page is! Students &&
                                      page is! Services
                                  ? themeColor
                                  : textColor),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

//Main button
class MainButton extends StatelessWidget {
  const MainButton({
    required this.child,
    this.width,
    this.height,
    this.onTap,
    this.color,
    this.hasPadding = true,
    this.hasBothPadding = false,
    this.outsideLeftPadding,
    this.outsideRightPadding,
    this.paddingType = 'vertical',
    this.customVerticalPadding,
    this.customHorizontalPadding,
    this.borderSize,
    this.borderRadius,
    this.borderColor,
    this.outsideBottomPadding,
    this.outsideTopPadding,
    this.hasShadow = false,
    this.isCustomBorderRadius = false,
    this.borderRadiusTopRight,
    this.borderRadiusTopLeft,
    this.borderRadiusBottomLeft,
    this.borderRadiusBottomRight,
    this.shadow,
    this.shadowColor,
    super.key,
  });

  final Widget child;
  final Function()? onTap;
  final Color? color;
  final Color? borderColor;
  final bool hasPadding;
  final bool hasBothPadding;
  final bool? hasShadow;
  final bool? isCustomBorderRadius;
  final String paddingType;
  final double? customVerticalPadding;
  final double? customHorizontalPadding;
  final double? outsideLeftPadding;
  final double? outsideRightPadding;
  final double? outsideBottomPadding;
  final double? outsideTopPadding;
  final double? borderSize;
  final double? borderRadius;
  final double? borderRadiusTopRight;
  final double? borderRadiusTopLeft;
  final double? borderRadiusBottomLeft;
  final double? borderRadiusBottomRight;
  final double? width;
  final double? height;
  final double? shadow;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
            left: outsideLeftPadding ?? 0,
            right: outsideRightPadding ?? 0,
            top: outsideTopPadding ?? 0,
            bottom: outsideBottomPadding ?? 0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeIn,
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(
            vertical: paddingType == 'vertical'
                ? (hasPadding ? customVerticalPadding ?? 11 : 0)
                : hasBothPadding
                    ? customVerticalPadding ?? 11
                    : 0,
            horizontal: paddingType == 'horizontal'
                ? (hasPadding ? customHorizontalPadding ?? 11 : 0)
                : hasBothPadding
                    ? customHorizontalPadding ?? 11
                    : 0,
          ),
          decoration: ShapeDecoration(
              color: color ?? buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: isCustomBorderRadius == true
                    ? BorderRadius.only(
                        topLeft: Radius.circular(borderRadiusTopLeft ?? 0),
                        topRight: Radius.circular(borderRadiusTopRight ?? 0),
                        bottomLeft:
                            Radius.circular(borderRadiusBottomLeft ?? 0),
                        bottomRight:
                            Radius.circular(borderRadiusBottomRight ?? 0),
                      )
                    : BorderRadius.circular(borderRadius ?? 8),
                side: BorderSide(
                  color: borderColor ?? Colors.transparent,
                  // Change to your desired border color
                  width: borderSize ?? 0, // Adjust border thickness
                ),
              ),
              shadows: [
                hasShadow == true
                    ? BoxShadow(
                        spreadRadius: 0,
                        color:
                            shadowColor ?? Colors.black.withValues(alpha: .3),
                        blurRadius: shadow ?? 3,
                        offset: Offset(0, 2))
                    : BoxShadow(
                        spreadRadius: 0,
                        color: Colors.transparent,
                        blurRadius: 0,
                      )
              ]),
          child: child,
        ),
      ),
    );
  }
}

//Cards
class Cards extends StatelessWidget {
  const Cards({
    required this.image,
    required this.images,
    super.key,
  });

  final String image;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: Duration(milliseconds: 250),
      curve: Curves.easeIn,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 300,
              height: 200,
              // decoration: BoxDecoration(
              //   color: [
              //     Color(0xff186A29),
              //     themeColor,
              //     Color(0xff282828),
              //   ][index],
              //   borderRadius: BorderRadius.circular(12),
              // ),
              // child: Image.asset(image),
              child: Image.asset(images[index]),
            );
          },
          itemCount: 3,
          loop: false,
          index: 1,
          viewportFraction: 0.8,
          scale: 0.9,
        ),
      ),
    );
  }
}

//Current Balance
class CurrentBalance extends StatelessWidget {
  const CurrentBalance({
    required this.balance,
    required this.decimal,
    super.key,
  });

  final double balance;
  final double decimal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Balance', style: titleStyle),
        FadeIn(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              jawaniCoin(25),
              Gap(2),
              Text(
                "${balance.toInt()}",
                softWrap: true,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '.${(decimal - decimal.toInt()).toStringAsFixed(2).split('.').last}',
                style: TextStyle(
                  fontSize: mainFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class PendingBalance extends StatelessWidget {
  const PendingBalance({
    required this.balance,
    required this.decimal,
    super.key,
  });

  final double balance;
  final double decimal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pending', style: titleStyle.copyWith(color: warningColor)),
        FadeIn(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Opacity(
                opacity: .65,
                child: jawaniCoin(25),
              ),
              Gap(2),
              Text(
                formatBalance(balance),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              Gap(5),
              Opacity(
                  opacity: .8,
                  child: Image.asset('assets/images/Gift Cards/ps_card.png'))
            ],
          ),
        )
      ],
    );
  }
}

//User Profile
class UserProfile extends StatelessWidget {
  const UserProfile({
    required this.image,
    required this.name,
    this.isAsset = false,
    super.key,
  });

  final String image;
  final String name;
  final bool isAsset;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
          height: 30,
          width: 30,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: isAsset
                ? Image.asset(
                    image,
                    fit: imageFit,
                  )
                : Image.network(
                    image,
                    fit: imageFit,
                  ),
          ),
        ),
        Gap(g1),
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: mainFontSize,
          ),
        )
      ],
    );
  }
}

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacement((context),
          MaterialPageRoute(builder: (context) {
        return StudentLandingPage();
      })),
      onLongPress: () => Navigator.pushReplacement((context),
          MaterialPageRoute(builder: (context) {
        return KidsLandingPage();
      })),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserProfile(
            isAsset: true,
            image: 'assets/images/saudi.jpg',
            name: 'Abdalaziz',
          ),
          Icon(
            Icons.notifications,
            color: nonFocusedColor,
          ),
        ],
      ),
    );
  }
}

class StudentNavigationBar extends StatelessWidget {
  const StudentNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacement((context),
          MaterialPageRoute(builder: (context) {
        return HomePage();
      })),
      onLongPress: () => Navigator.pushReplacement((context),
          MaterialPageRoute(builder: (context) {
        return KidsLandingPage();
      })),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserProfile(
            isAsset: true,
            image: 'assets/images/Students/person 3.png',
            name: 'Saud',
          ),
          Icon(
            Icons.notifications,
            color: nonFocusedColor,
          ),
        ],
      ),
    );
  }
}

//Task card

class TaskCard extends StatelessWidget {
  const TaskCard({
    required this.name,
    required this.book,
    required this.amount,
    required this.giftCard,
    required this.isAmount,
    super.key,
  });

  final String name;
  final String book;
  final String giftCard;
  final int amount;
  final bool isAmount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: secondaryGap),
      child: MainButton(
        hasPadding: false,
        height: 178,
        width: 151,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              book,
              style: secondaryStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              'assets/images/Books/${book.toLowerCase()}.png',
              height: 116,
              width: 151,
              fit: imageFit,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  name,
                  style: secondaryStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                isAmount
                    ? Row(
                        children: [
                          jawaniCoin(12),
                          Text(
                            amount.toString(),
                            style: secondaryStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    : Image.asset(
                        giftCard,
                        width: 20,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Main text field
class MainTextField extends StatelessWidget {
  const MainTextField({
    required this.title,
    required this.hint,
    required this.onChanged,
    this.isAmount = false,
    this.initialValue = '',
    this.controller,
    super.key,
  });

  final String title;
  final String hint;
  final bool isAmount;
  final String initialValue;
  final TextEditingController? controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        Gap(childGap),
        MainButton(
          paddingType: 'horizontal',
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: titleStyle.copyWith(
                color: nonFocusedColor,
              ),
              suffix: isAmount ? jawaniCoin(13) : null,
            ),
            textInputAction: TextInputAction.done,
            keyboardType: isAmount ? TextInputType.number : TextInputType.name,
            onSubmitted: (value) {
              FocusScope.of(context).unfocus();
            },
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            style: titleStyle.copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

//Main date picker

class MainDatePicker extends StatelessWidget {
  const MainDatePicker({
    required this.state,
    super.key,
  });

  final TaskCreationState state;

  @override
  Widget build(BuildContext context) {
    return MainButton(
      width: double.infinity,
      hasBothPadding: true,
      customVerticalPadding: 14,
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: state.dueDate,
          firstDate: DateTime.now().add(Duration(days: 1)),
          lastDate: DateTime(2100),
          // Customize the theme of the DatePicker here
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.dark().copyWith(
                primaryColor: themeColor,
                // Set the primary color (for selected date)
                hintColor: secondaryThemeColor,
                buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.primary, // Set button text color
                ),
              ),
              child: child!,
            );
          },
        );

        if (picked != null && picked != state.dueDate) {
          if (context.mounted) {
            context.read<TaskCreationCubit>().updateDueDate(picked);
          }
        }
      },
      child: Text(
        DateFormat('dd / MM / yyyy').format(state.dueDate),
        style: titleStyle.copyWith(color: Colors.black),
      ),
    );
  }
}

//Main book card
class MainBookCard extends StatelessWidget {
  const MainBookCard({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  final String image;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MainButton(
        hasBothPadding: true,
        color: Colors.transparent,
        child: Column(
          children: [
            Image.asset(
              image,
              height: 116,
              fit: imageFit,
            ),
            Gap(g1),
            Text(
              title,
              style: secondaryStyle.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Smart contract card

class SmartContractWidget extends StatelessWidget {
  const SmartContractWidget({
    super.key,
    required this.remainingDate,
    required this.i,
    required this.state,
  });

  final int remainingDate;
  final int i;
  final TaskCreationState state;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamCubit, ExamState>(
      builder: (context, exam) {
        return exam.isCompleted.contains(i)
            ? MainButton(
                borderColor: themeColor,
                borderSize: 1.5,
                customVerticalPadding: 70,
                outsideBottomPadding: secondaryGap,
                child: Center(
                  child: Text(
                    'Task Completed ( ${state.tasks[i].name.isEmpty ? 'Task ${i + 1}' : state.tasks[i].name} )',
                    style: titleStyle.copyWith(color: themeColor),
                  ),
                ),
              )
            : MainButton(
                onTap: () {
                  context.read<TaskCreationCubit>().updateTask(index: i);
                  Navigator.push((context),
                      MaterialPageRoute(builder: (context) {
                    return Book();
                  }));
                },
                outsideBottomPadding: secondaryGap,
                hasBothPadding: true,
                child: Column(
                  children: [
                    MainButton(
                      hasPadding: true,
                      hasBothPadding: true,
                      paddingType: 'horizontal',
                      customVerticalPadding: 5,
                      width: double.infinity,
                      color: remainingDate < 5
                          ? Colors.red
                          : remainingDate < 10
                              ? Colors.deepOrangeAccent
                              : Colors.green,
                      child: Center(
                        child: Text(
                          '$remainingDate Days Remaining',
                          style: secondaryStyle.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    Gap(secondaryGap),
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${state.tasks[i].name.isEmpty ? 'Task ${i + 1}' : state.tasks[i].name} (${state.tasks[i].book})',
                                style: titleStyle,
                              ),
                              Gap(g1),
                              Text(
                                '1. Complete the Test within ${DateFormat('dd/MM/yyyy').format(state.tasks[i].dueDate)}'
                                '\n2. Score above 90%',
                                style: secondaryStyle,
                              ),
                              Gap(g1),
                              Row(
                                children: [
                                  Text(
                                    'Reward ',
                                    style: titleStyle.copyWith(
                                        color: Colors.green),
                                  ),
                                  state.tasks[i].isAmount
                                      ? Row(
                                          children: [
                                            jawaniCoin(15),
                                            Text(
                                              formatBalance(
                                                  state.tasks[i].amount),
                                              style: titleStyle.copyWith(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        )
                                      : Image.asset(
                                          state.tasks[i].giftCard,
                                          width: 20,
                                        )
                                ],
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/Books/${state.tasks[i].book.toLowerCase()}.png',
                            width: 70,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
      },
    );
  }
}

// Kids Smart contract card

class KidsSmartContractWidget extends StatelessWidget {
  const KidsSmartContractWidget({
    super.key,
    required this.remainingDate,
    required this.i,
    required this.state,
  });

  final int remainingDate;
  final int i;
  final TaskCreationState state;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamCubit, ExamState>(
      builder: (context, exam) {
        return exam.isCompleted.contains(i)
            ? MainButton(
                borderColor: themeColor,
                borderSize: 1.5,
                customVerticalPadding: 30,
                borderRadius: kidsBorderRadius,
                outsideBottomPadding: secondaryGap,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        state.tasks[i].name.isEmpty
                            ? 'Task ${i + 1}'
                            : state.tasks[i].name,
                        style: titleStyle.copyWith(color: themeColor),
                      ),
                      Gap(secondaryGap),
                      MainButton(
                        borderColor: themeColor,
                        borderRadius: kidsBorderRadius,
                        borderSize: 1.5,
                        hasBothPadding: true,
                        customVerticalPadding: 5,
                        customHorizontalPadding: 80,
                        child: Text(
                          'Completed',
                          style: titleStyle.copyWith(color: themeColor),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : MainButton(
                onTap: () {
                  context
                      .read<TaskCreationCubit>()
                      .updateTask(index: i, isKids: true);
                  Navigator.push((context),
                      MaterialPageRoute(builder: (context) {
                    return Book();
                  }));
                },
                outsideBottomPadding: secondaryGap,
                hasBothPadding: true,
                borderRadius: kidsBorderRadius,
                child: Column(
                  children: [
                    MainButton(
                      hasPadding: true,
                      hasBothPadding: true,
                      borderRadius: kidsBorderRadius,
                      customVerticalPadding: 7,
                      customHorizontalPadding: 10,
                      width: double.infinity,
                      borderSize: 2,
                      borderColor: remainingDate < 5
                          ? Color(0xff9B0104)
                          : remainingDate < 10
                              ? Colors.deepOrange
                              : Colors.green,
                      color: remainingDate < 5
                          ? Color(0xffFF6265)
                          : remainingDate < 10
                              ? Colors.deepOrangeAccent
                              : Colors.green.withValues(alpha: .7),
                      child: Center(
                        child: Text(
                          '$remainingDate ${remainingDate == 1 ? 'Day' : 'Days'} Remaining',
                          style: secondaryStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Gap(secondaryGap),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 210,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainButton(
                                borderSize: 2,
                                borderColor: themeColor,
                                borderRadius: kidsBorderRadius,
                                hasBothPadding: true,
                                customVerticalPadding: 8,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Reward ',
                                      style: titleStyle.copyWith(
                                          color: themeColor),
                                    ),
                                    state.tasks[i].isAmount
                                        ? Row(
                                            children: [
                                              jawaniCoin(15),
                                              Text(
                                                formatBalance(
                                                    state.tasks[i].amount),
                                                style: titleStyle.copyWith(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Image.asset(
                                            state.tasks[i].giftCard,
                                            width: 30,
                                          )
                                  ],
                                ),
                              ),
                              Gap(secondaryGap),
                              Text(
                                '${state.tasks[i].name.isEmpty ? 'Task ${i + 1}' : state.tasks[i].name} (${state.tasks[i].book})',
                                style: titleStyle.copyWith(color: themeColor),
                              ),
                              Gap(g1),
                              Text(
                                '1. Complete the Test within ${DateFormat('dd/MM/yyyy').format(state.tasks[i].dueDate)}'
                                '\n2. Score above 90%',
                                style: secondaryStyle.copyWith(
                                    color: textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Gap(g1),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/Books/${state.tasks[i].book.toLowerCase()}.png',
                            width: 100,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
      },
    );
  }
}

//Kids Services

class KidsServices extends StatefulWidget {
  const KidsServices({super.key});

  @override
  State<KidsServices> createState() => _KidsServicesState();
}

final colors = const [
  Colors.red,
  Colors.green,
  Colors.greenAccent,
  Colors.amberAccent,
  Colors.blue,
  Colors.green,
  Colors.teal,
  Colors.amber,
  Colors.brown,
  Colors.redAccent,
  Colors.tealAccent,
];

class _KidsServicesState extends State<KidsServices> {
  // 1. Create a PageController and manage its state
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    // Initialize the controller. The viewportFraction is set here.
    _pageController = PageController(viewportFraction: 0.35);
  }

  @override
  void dispose() {
    // 4. Don't forget to dispose of the controller
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 2. Use a Column to stack the PageView and the dots
    return Column(
      children: [
        // Give the PageView a specific height so the Column can layout correctly
        SizedBox(
          height: 130, // Adjust this height to fit your content
          child: PageView.builder(
            controller: _pageController,
            // Use the stateful controller
            scrollDirection: Axis.horizontal,
            itemCount: studentServicesList.length,
            padEnds: false,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MainButton(
                    color: kidsColor3,
                    height: 66,
                    width: 66,
                    hasShadow: true,
                    borderRadius: 100,
                    child: studentServicesList[index].iconBuilder(Colors.black),
                  ),
                  Gap(secondaryGap),
                  Text(
                    studentServicesList[index].title,
                    textAlign: TextAlign.center,
                    style: titleStyle,
                  ),
                ],
              );
            },
          ),
        ),

        Gap(secondaryGap),

        SmoothPageIndicator(
          controller: _pageController, // The same controller from above
          count: studentServicesList.length - 2,
          onDotClicked: (i) => _pageController.jumpToPage(i),
          // effect: CustomizableEffect(
          //   activeDotDecoration: DotDecoration(
          //     width: 10,
          //     height: 10,
          //     color: kidsColor3,
          //     rotationAngle: 180,
          //     verticalOffset: -5,
          //     borderRadius: BorderRadius.circular(0),
          //     dotBorder: DotBorder(
          //       padding: 2,
          //       width: 2,
          //       color: kidsColor3,
          //     ),
          //   ),
          //   dotDecoration: DotDecoration(
          //     width: 10,
          //     height: 10,
          //     // dotBorder: DotBorder(
          //     //   padding: 2,
          //     //   width: 2,
          //     //   color: Colors.grey,
          //     // ),
          //     // borderRadius: BorderRadius.only(
          //     //     topLeft: Radius.circular(2),
          //     //     topRight: Radius.circular(16),
          //     //     bottomLeft: Radius.circular(16),
          //     //     bottomRight: Radius.circular(2)),
          //     borderRadius: BorderRadius.circular(16),
          //     verticalOffset: 0,
          //     color: Colors.blueGrey.shade300,
          //   ),
          //   spacing: 6.0,
          //   // activeColorOverride: (i) => colors[i],
          //   // inActiveColorOverride: (i) => colors[i],
          // ),
          effect: WormEffect(
            type: WormType.thin,
            dotHeight: 10,
            dotWidth: 10,
            dotColor: Colors.blueGrey.shade100,
            activeDotColor: kidsColor3,
          ),
        ),
      ],
    );
  }
}
