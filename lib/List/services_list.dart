import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:semapay/Cubit/Navigation/navigation_cubit.dart';
import 'package:semapay/UI/Screens/Education/select_student.dart';
import 'package:semapay/UI/Screens/service_pages.dart';

import '../UI/const.dart';

class ServicesList {
  ServicesList({
    required this.title,
    required this.icon,
    this.onlyString = false,
    this.onTap,
  });

  Widget icon;
  String title;
  bool onlyString;
  Function()? onTap;
}

List<ServicesList> servicesList = [
  ServicesList(
    title: 'Transfer',
    icon: HugeIcon(
      icon: HugeIcons.strokeRoundedArrowDataTransferHorizontal,
      color: themeColor,
      size: 30,
    ),
  ),
  ServicesList(
    title: 'Request',
    icon: Icon(
      Icons.u_turn_left_rounded,
      color: themeColor,
      size: 25,
    ),
  ),
  ServicesList(
    title: 'International Transfer',
    icon: HugeIcon(
      icon: HugeIcons.strokeRoundedAirplaneTakeOff01,
      color: themeColor,
      size: 30,
    ),
  ),
  ServicesList(
    title: 'Local Bank Transfer',
    icon: HugeIcon(
      icon: HugeIcons.strokeRoundedBank,
      color: themeColor,
      size: 30,
    ),
  ),
  ServicesList(
      title: 'Split Money',
      icon: Icon(
        Icons.vertical_split_outlined,
        color: themeColor,
        size: 25,
      )),
  ServicesList(
      title: 'Send Gift',
      icon: Icon(
        Icons.card_giftcard_outlined,
        color: themeColor,
        size: 25,
      )),
  // ServicesList(
  //   title: 'Domestic Labour Salaries',
  //   icon: HugeIcon(
  //     icon: HugeIcons.strokeRoundedCashier02,
  //     color: themeColor,
  //     size: 30,
  //   ),
  // ),
];
List<ServicesList> studentServicesList = [
  ServicesList(
    title: 'Transfer',
    icon: HugeIcon(
      icon: HugeIcons.strokeRoundedArrowDataTransferHorizontal,
      color: themeColor,
      size: 30,
    ),
  ),
  ServicesList(
    title: 'Request',
    icon: Icon(
      Icons.u_turn_left_rounded,
      color: themeColor,
      size: 25,
    ),
  ),
  ServicesList(
    title: 'International Transfer',
    icon: HugeIcon(
      icon: HugeIcons.strokeRoundedAirplaneTakeOff01,
      color: themeColor,
      size: 30,
    ),
  ),
  ServicesList(
    title: 'Local Bank Transfer',
    icon: HugeIcon(
      icon: HugeIcons.strokeRoundedBank,
      color: themeColor,
      size: 30,
    ),
  ),
  //
  ServicesList(
    title: 'Saving',
    icon: HugeIcon(
      icon: HugeIcons.strokeRoundedMoneySavingJar,
      color: themeColor,
      size: 30,
    ),
  ),
  ServicesList(
    title: 'Investment',
    icon: HugeIcon(
      icon: HugeIcons.strokeRoundedMoneyAdd01,
      color: themeColor,
      size: 30,
    ),
  ),
  ServicesList(
    title: 'Responsibility',
    icon: Icon(
      Icons.work_outline,
      color: themeColor,
      size: 25,
    ),
  ),
  ServicesList(
    title: 'Entrepreneurship',
    icon: HugeIcon(
      icon: HugeIcons.strokeRoundedHotel01,
      color: themeColor,
      size: 30,
    ),
  ),
  ServicesList(
    title: 'Health',
    icon: Icon(
      Icons.health_and_safety_outlined,
      color: themeColor,
      size: 25,
    ),
  ),
  ServicesList(
    title: 'Charity',
    icon: HugeIcon(
      icon: HugeIcons.strokeRoundedCharity,
      color: themeColor,
      size: 30,
    ),
  ),

  ServicesList(
      title: 'Split Money',
      icon: Icon(
        Icons.vertical_split_outlined,
        color: themeColor,
        size: 25,
      )),
  ServicesList(
      title: 'Send Gift',
      icon: Icon(
        Icons.card_giftcard_outlined,
        color: themeColor,
        size: 25,
      )),
  // ServicesList(
  //   title: 'Domestic Labour Salaries',
  //   icon: HugeIcon(
  //     icon: HugeIcons.strokeRoundedCashier02,
  //     color: themeColor,
  //     size: 30,
  //   ),
  // ),
];

List<ServicesList> getSemanoorSmartBookList(BuildContext context) {
  return [
    ServicesList(
      onlyString: true,
      title: 'SEMANOOR',
      icon: HugeIcon(
        icon: HugeIcons.strokeRoundedCashier02,
        color: themeColor,
        size: 30,
      ),
    ),
    ServicesList(
      onTap: () {
        context.read<NavigationCubit>().page(SelectStudentEducation());
      },
      title: 'Education',
      icon: Icon(
        Icons.school_outlined,
        color: themeColor,
        size: 25,
      ),
    ),
    ServicesList(
      title: 'Donation',
      onTap: () => context
          .read<NavigationCubit>()
          .serviceName(EhsanDonationWidget(), 'donation'),
      icon: HugeIcon(
        icon: HugeIcons.strokeRoundedCharity,
        color: themeColor,
        size: 30,
      ),
    ),
    ServicesList(
      title: 'Saving',
      onTap: () => context
          .read<NavigationCubit>()
          .serviceName(SavingsOverviewWidget(), 'Saving'),
      icon: Image.asset(
        'assets/images/saudi_saving.png',
        width: 30,
      ),
    ),
    ServicesList(
      onTap: () => context
          .read<NavigationCubit>()
          .serviceName(Investment(), 'Investment'),
      title: 'Investment',
      icon: Icon(
        Icons.trending_up,
        size: 30,
        color: themeColor,
      ),
    ),
    ServicesList(
      onTap: () => context
          .read<NavigationCubit>()
          .serviceName(Entrepreneurship(), 'Entrepreneurship'),
      title: 'Entrepreneurship',
      icon: Icon(
        Icons.work_outline,
        color: themeColor,
        size: 25,
      ),
    ),
    ServicesList(
      title: 'Volunteer',
      icon: Icon(
        Icons.volunteer_activism_outlined,
        fill: 0,
        size: 30,
        color: themeColor,
      ),
    ),
    ServicesList(
      title: 'Health',
      icon: HugeIcon(
        icon: HugeIcons.strokeRoundedHealth,
        color: themeColor,
        size: 30,
      ),
    ),
    ServicesList(
      title: 'Special Task',
      icon: HugeIcon(
        icon: HugeIcons.strokeRoundedTask01,
        color: themeColor,
        size: 30,
      ),
    ),
  ];
}
