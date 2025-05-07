import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:semapay/Cubit/Balance/balance_cubit.dart';
import 'package:semapay/Cubit/Navigation/navigation_cubit.dart';
import 'package:semapay/UI/Screens/landing_page.dart';

import '../const.dart';
import '../widgets.dart';

class AddMoney extends StatefulWidget {
  const AddMoney({super.key});

  @override
  State<AddMoney> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {
  double currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: screenHeight(context),
        child: SingleChildScrollView(
          child: BlocBuilder<BalanceCubit, BalanceState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: mainPadding,
                    child: Column(
                      children: [
                        MainNavigationBar(),
                        Gap(mainGap),
                        Text(
                          'Add Money',
                          style: titleStyle.copyWith(color: Colors.black),
                        ),
                        Gap(secondaryGap),
                        MainTextField(
                          onChanged: (value) {
                            double enteredAmount =
                                double.tryParse(value) ?? 0.0;
                            currentValue = enteredAmount;
                          },
                          isAmount: true,
                          title: 'Amount',
                          hint: '100',
                        ),
                        Gap(secondaryGap),
                        MainButton(
                          onTap: () {
                            context.read<NavigationCubit>().page(LandingPage());

                            context.read<BalanceCubit>().balance(
                                fatherBalance:
                                    currentValue + state.fatherBalance);
                          },
                          hasBothPadding: true,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.credit_card,
                                color: Colors.black,
                                size: 20,
                              ),
                              Gap(5),
                              Text(
                                'Debit / Credit card',
                                style: titleStyle.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                        Gap(secondaryGap),
                        MainButton(
                            onTap: () {
                              context
                                  .read<NavigationCubit>()
                                  .page(LandingPage());

                              context.read<BalanceCubit>().balance(
                                  fatherBalance:
                                      currentValue + state.fatherBalance);
                            },
                            hasBothPadding: true,
                            paddingType: 'horizontal',
                            customVerticalPadding: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/apple_pay.png',
                                  width: 55,
                                ),
                              ],
                            ))
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
