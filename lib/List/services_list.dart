import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:semapay/Cubit/Navigation/navigation_cubit.dart';
import 'package:semapay/UI/Screens/Education/select_student.dart';
import 'package:semapay/UI/Screens/service_pages.dart';

import '../UI/const.dart';

// --- Placeholder for your theme color ---
// TODO: Make sure this `themeColor` points to the actual color in your UI constants.

// 1. MODIFIED SERVICESLIST CLASS
// It now uses `iconBuilder` to create icons on demand with the correct color.
class ServicesList {
  ServicesList({
    required this.title,
    required this.iconBuilder, // Changed from 'icon'
    this.onlyString = false,
    this.color, // Optional color override for a specific item
    this.onTap,
  });

  final String title;
  final bool onlyString;
  final Function()? onTap;
  final Color? color;

  // Stores a function that knows how to build the icon
  final Widget Function(Color? color) iconBuilder;

  // This getter builds the final icon widget when it's needed.
  // It applies the item's specific color or falls back to the themeColor.
  Widget get icon {
    return iconBuilder(color ?? themeColor);
  }
}

// 2. UPDATED LIST DEFINITIONS
// All lists now use the `iconBuilder` pattern.

List<ServicesList> servicesList = [
  ServicesList(
    title: 'Transfer',
    iconBuilder: (c) => HugeIcon(
      icon: HugeIcons.strokeRoundedArrowDataTransferHorizontal,
      color: c ?? themeColor,
      size: 35,
    ),
  ),
  ServicesList(
    title: 'Request',
    iconBuilder: (c) => Icon(
      Icons.u_turn_left_rounded,
      color: c,
      size: 35,
    ),
  ),
  ServicesList(
    title: 'International Transfer',
    iconBuilder: (c) => HugeIcon(
      icon: HugeIcons.strokeRoundedAirplaneTakeOff01,
      color: c ?? themeColor,
      size: 35,
    ),
  ),
  ServicesList(
    title: 'Local Bank Transfer',
    iconBuilder: (c) => HugeIcon(
      icon: HugeIcons.strokeRoundedBank,
      color: c ?? themeColor,
      size: 35,
    ),
  ),
  ServicesList(
    title: 'Split Money',
    iconBuilder: (c) => Icon(
      Icons.vertical_split_outlined,
      color: c,
      size: 35,
    ),
  ),
  ServicesList(
    title: 'Send Gift',
    iconBuilder: (c) => Icon(
      Icons.card_giftcard_outlined,
      color: c,
      size: 35,
    ),
  ),
];

List<ServicesList> studentServicesList = [
  ServicesList(
    title: 'Transfer',
    iconBuilder: (c) => HugeIcon(
      icon: HugeIcons.strokeRoundedArrowDataTransferHorizontal,
      color: c ?? themeColor,
      size: 35,
    ),
  ),
  ServicesList(
    title: 'Request',
    iconBuilder: (c) => Icon(
      Icons.u_turn_left_rounded,
      color: c,
      size: 35,
    ),
  ),
  ServicesList(
    title: 'International Transfer',
    iconBuilder: (c) => HugeIcon(
      icon: HugeIcons.strokeRoundedAirplaneTakeOff01,
      color: c ?? themeColor,
      size: 35,
    ),
  ),
  ServicesList(
    title: 'Local Bank Transfer',
    iconBuilder: (c) => HugeIcon(
      icon: HugeIcons.strokeRoundedBank,
      color: c ?? themeColor,
      size: 35,
    ),
  ),
  ServicesList(
    title: 'Saving',
    iconBuilder: (_) => Image.asset(
      'assets/images/saudi_saving.png',
      width: 27,
    ),
  ),
  ServicesList(
    title: 'Investment',
    iconBuilder: (c) => HugeIcon(
      icon: HugeIcons.strokeRoundedMoneyAdd01,
      color: c ?? themeColor,
      size: 35,
    ),
  ),
  ServicesList(
    title: 'Responsibility',
    iconBuilder: (c) => Icon(
      Icons.work_outline,
      color: c,
      size: 35,
    ),
  ),
  ServicesList(
    title: 'Entrepreneurship',
    iconBuilder: (c) => HugeIcon(
      icon: HugeIcons.strokeRoundedHotel01,
      color: c ?? themeColor,
      size: 35,
    ),
  ),
  ServicesList(
    title: 'Health',
    iconBuilder: (c) => Icon(
      Icons.health_and_safety_outlined,
      color: c,
      size: 25,
    ),
  ),
  ServicesList(
    title: 'Charity',
    iconBuilder: (c) => HugeIcon(
      icon: HugeIcons.strokeRoundedCharity,
      color: c ?? themeColor,
      size: 35,
    ),
  ),
  ServicesList(
    title: 'Split Money',
    iconBuilder: (c) => Icon(
      Icons.vertical_split_outlined,
      color: c,
      size: 35,
    ),
  ),
  ServicesList(
    title: 'Send Gift',
    iconBuilder: (c) => Icon(
      Icons.card_giftcard_outlined,
      color: c,
      size: 35,
    ),
  ),
];

List<ServicesList> getSemanoorSmartBookList(BuildContext context) {
  return [
    ServicesList(
      onlyString: true,
      title: 'Knowledge\nHub',
      iconBuilder: (_) => Image.asset(
        'assets/images/Semanoor PNG - Logo.png',
        width: 64,
      ),
    ),
    ServicesList(
      onTap: () {
        context.read<NavigationCubit>().page(SelectStudentEducation());
      },
      title: 'Education',
      iconBuilder: (c) => Icon(
        Icons.school_outlined,
        color: c,
        size: 35,
      ),
    ),
    ServicesList(
      onTap: () {
        context.read<NavigationCubit>().page(SelectStudentEducation());
      },
      title: 'Training',
      iconBuilder: (c) =>
          Icon(IconsaxPlusLinear.note, fill: .1, color: c, size: 35),
    ),
    ServicesList(
      title: 'Saving',
      onTap: () => context
          .read<NavigationCubit>()
          .serviceName(SavingsOverviewWidget(), 'Saving'),
      // For Image.asset, we ignore the color parameter by using '_'
      iconBuilder: (_) => Image.asset(
        'assets/images/saudi_saving.png',
        width: 27,
      ),
    ),
    ServicesList(
      onTap: () => context
          .read<NavigationCubit>()
          .serviceName(Investment(), 'Investment'),
      title: 'Investment',
      iconBuilder: (c) => Icon(
        Icons.trending_up,
        size: 35,
        color: c,
      ),
    ),
    ServicesList(
      onTap: () => context
          .read<NavigationCubit>()
          .serviceName(Entrepreneurship(), 'Entrepreneurship'),
      title: 'Entrepreneur',
      iconBuilder: (_) => Image.asset(
        'assets/images/business_logo.png',
        width: 27,
      ),
    ),
    ServicesList(
      title: 'Health',
      iconBuilder: (c) =>
          Icon(IconsaxPlusLinear.heart_circle, fill: .1, color: c, size: 35),
    ),
    ServicesList(
      title: 'Library',
      iconBuilder: (c) =>
          Icon(IconsaxPlusLinear.book_1, fill: .1, color: c, size: 35),
    ),
    ServicesList(
      title: 'Special Task',
      iconBuilder: (c) => HugeIcon(
        icon: HugeIcons.strokeRoundedTask01,
        color: c ?? themeColor,
        size: 35,
      ),
    ),
    ServicesList(
      title: 'Donation',
      onTap: () => context
          .read<NavigationCubit>()
          .serviceName(EhsanDonationWidget(), 'donation'),
      iconBuilder: (c) => HugeIcon(
        icon: HugeIcons.strokeRoundedCharity,
        color: c ?? themeColor,
        size: 35,
      ),
    ),
    ServicesList(
      title: 'Volunteer',
      iconBuilder: (c) => Icon(
        Icons.volunteer_activism_outlined,
        fill: 0,
        size: 35,
        color: c,
      ),
    ),
    ServicesList(
      title: 'Market Place',
      iconBuilder: (c) =>
          Icon(IconsaxPlusLinear.shop, fill: .1, color: c, size: 35),
    ),
  ];
}
