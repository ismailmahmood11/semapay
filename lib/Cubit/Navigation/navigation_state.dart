part of 'navigation_cubit.dart';

sealed class NavigationState {
  NavigationState(
      {required this.page, this.studentAdded = false, this.serviceName = ''});

  bool studentAdded;
  Widget page;
  String serviceName;
}

final class NavigationInitial extends NavigationState {
  NavigationInitial(
      {required super.page, super.studentAdded, super.serviceName});
}
