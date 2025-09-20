import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:semapay/Cubit/Balance/balance_cubit.dart';
import 'package:semapay/Cubit/Navigation/navigation_cubit.dart';
import 'package:semapay/Cubit/Task%20creation/task_creation_cubit.dart';
import 'package:semapay/UI/const.dart';
import 'package:semapay/UI/home_page.dart';

import 'Cubit/Exam/exam_cubit.dart';

//jawani
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => TaskCreationCubit(),
        ),
        BlocProvider(
          create: (context) => BalanceCubit(),
        ),
        BlocProvider(
          create: (context) => ExamCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
          // Set primary color (e.g., for AppBar, buttons, etc.)
          colorScheme: ColorScheme.light(
            primary: themeColor, // Primary color for light theme
            secondary: secondaryThemeColor, // Secondary color for light theme
          ),

          buttonTheme: ButtonThemeData(
            buttonColor: themeColor, // Button color
            textTheme: ButtonTextTheme.primary, // Button text color
          ),

          scaffoldBackgroundColor: Colors.white, // Background color of the app
        ),
        title: 'SemaPay',
        home: HomePage(),
      ),
    );
  }
}
