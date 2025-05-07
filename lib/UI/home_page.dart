import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:semapay/UI/widgets.dart';

import '../Cubit/Navigation/navigation_cubit.dart';
import 'const.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, currentPage) {
          return Stack(
            children: [
              PageTransitionSwitcher(
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return FadeThroughTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  );
                },
                child: currentPage.page,
              ),
              BottomBar(),
            ],
          );
        },
      ),
    );
  }
}
