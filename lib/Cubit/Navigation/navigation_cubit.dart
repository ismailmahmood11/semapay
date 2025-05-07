import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:semapay/UI/Screens/landing_page.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(NavigationInitial(
            page: LandingPage(), studentAdded: false, serviceName: ''));

  void page(Widget page) =>
      emit(NavigationInitial(page: page, studentAdded: state.studentAdded));

  void addStudents(Widget page, bool isStudentAdded) =>
      emit(NavigationInitial(page: page, studentAdded: isStudentAdded));

  void serviceName(Widget page, String serviceName) =>
      emit(NavigationInitial(page: page, serviceName: serviceName));
}
