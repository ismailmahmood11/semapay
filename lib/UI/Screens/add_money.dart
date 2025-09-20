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
  TextEditingController controller = TextEditingController();

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
                          'Add Jawani Credits',
                          style: titleStyle.copyWith(color: Colors.black),
                        ),
                        Gap(secondaryGap),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainButton(
                              color: Colors.transparent,
                              paddingType: 'horizontal',
                              child: TextField(
                                // controller: controller,
                                controller: controller,
                                onChanged: (value) {
                                  double enteredAmount =
                                      double.tryParse(value) ?? 0.0;
                                  currentValue = enteredAmount;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter Amount Here',
                                  hintStyle: titleStyle.copyWith(
                                      color: nonFocusedColor, fontSize: 20),
                                  // suffix: saudiRiyal(13),
                                  suffix: saudiRiyal(30),
                                ),
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                onSubmitted: (value) {
                                  FocusScope.of(context).unfocus();
                                },
                                onTapOutside: (event) {
                                  FocusScope.of(context).unfocus();
                                },
                                style: titleStyle.copyWith(
                                    color: Colors.black, fontSize: 40),
                              ),
                            ),
                          ],
                        ),
                        Gap(secondaryGap),
                        Gap(secondaryGap),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MainButton(
                              onTap: () {
                                setState(() {
                                  currentValue = 10;
                                });
                                controller.text = '10';
                              },
                              hasBothPadding: true,
                              child: Row(
                                children: [
                                  Text(
                                    '10',
                                    style: titleStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Gap(3),
                                  saudiRiyal(18)
                                ],
                              ),
                            ),
                            MainButton(
                              onTap: () {
                                setState(() {
                                  currentValue = 50;
                                });
                                controller.text = '50';
                              },
                              hasBothPadding: true,
                              child: Row(
                                children: [
                                  Text(
                                    '50',
                                    style: titleStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Gap(3),
                                  saudiRiyal(18)
                                ],
                              ),
                            ),
                            MainButton(
                              onTap: () {
                                setState(() {
                                  currentValue = 100;
                                });
                                controller.text = '100';
                              },
                              hasBothPadding: true,
                              child: Row(
                                children: [
                                  Text(
                                    '100',
                                    style: titleStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Gap(3),
                                  saudiRiyal(18)
                                ],
                              ),
                            ),
                            MainButton(
                              onTap: () {
                                setState(() {
                                  currentValue = 1000;
                                });
                                controller.text = '1000';
                              },
                              hasBothPadding: true,
                              child: Row(
                                children: [
                                  Text(
                                    '1000',
                                    style: titleStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Gap(3),
                                  saudiRiyal(18)
                                ],
                              ),
                            ),
                          ],
                        ),
                        Gap(mainGap * 10),
                        Row(
                          children: [
                            Text(
                              'Jawani Credits = $currentValue',
                              style: titleStyle.copyWith(color: Colors.black),
                            ),
                            Gap(5),
                            jawaniCoin(15),
                          ],
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
                            customVerticalPadding: 2 + 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/apple_pay.png',
                                  width: 55,
                                ),
                              ],
                            )),
                        Gap(bottomGap),
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
