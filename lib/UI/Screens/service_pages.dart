import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../const.dart';
import '../widgets.dart';

class EhsanDonationWidget extends StatelessWidget {
  const EhsanDonationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Avoids notches and system overlays
      child: Padding(
        padding: mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainNavigationBar(),
            Gap(mainGap),
            Text(
              'To',
              style: titleStyle,
            ),
            Gap(secondaryGap),
            Image.asset(
              'assets/images/ehsan.png',
              // Replace with your actual logo asset path
              width: 150, // Adjust height as needed
            ),
            Gap(mainGap),
            Text(
              'Donate',
              style: titleStyle,
            ),
            Gap(secondaryGap),
            Wrap(
              spacing: 12.0, // Horizontal space between buttons
              runSpacing: 12.0, // Vertical space between rows
              children: [
                _buildDonationButton('Help a patient'),
                _buildDonationButton('Support a crook.'),
                // Keeping text from image
                _buildDonationButton('Take care of an orphan.'),
                _buildDonationButton('Take out Zakat.'),
                _buildDonationButton('Afghan affected'),
                _buildDonationButton('Save a home.'),
                _buildDonationButton('Feed a needy.'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDonationButton(String text) {
    return MainButton(
      onTap: () {},
      hasBothPadding: true,
      child: Text(
        text,
        style: secondaryStyle,
      ),
    );
  }
}

///
///
///

class SavingsOverviewWidget extends StatefulWidget {
  // Initial values are passed to the state
  final double initialSavingAmount;
  final double initialPercentageOfIncome;
  final double initialSavingsGoalAmount;
  final String initialSavingsGoalTitle;
  final List<double> initialMonthlySavings;
  final List<String> initialMonths;

  const SavingsOverviewWidget({
    super.key,
    this.initialSavingAmount = 1500.0,
    this.initialPercentageOfIncome = 15.0,
    this.initialSavingsGoalAmount = 5000.0,
    this.initialSavingsGoalTitle = 'Emergency Fund',
    this.initialMonthlySavings = const [
      200,
      350,
      500,
      450,
      10,
    ],
    this.initialMonths = const [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
    ],
  });

  @override
  State<SavingsOverviewWidget> createState() => _SavingsOverviewWidgetState();
}

class _SavingsOverviewWidgetState extends State<SavingsOverviewWidget> {
  late double _savingAmount;
  late double _savingsGoalAmount;
  double _newAmount = 0.0; // State variable for the amount text field value
  late List<double> _monthlySavings;
  late List<String> _months;

  late double _percentageOfIncome; // This might need a more complex calculation

  // Controller for the Amount text field
  final TextEditingController _amountController = TextEditingController();

  // Controller for the Goal text field (optional, but good for initial value)
  final TextEditingController _goalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _savingAmount = widget.initialSavingAmount;
    _savingsGoalAmount = widget.initialSavingsGoalAmount;
    _monthlySavings = List.from(widget.initialMonthlySavings);
    _months = List.from(widget.initialMonths);
    _percentageOfIncome =
        widget.initialPercentageOfIncome; // Initialize percentage

    // Initialize text field controllers
    _amountController.text = ''; // Start with empty amount
    _goalController.text =
        _savingsGoalAmount.toStringAsFixed(0); // Display initial goal
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the tree
    _amountController.dispose();
    _goalController.dispose();
    super.dispose();
  }

  // Method to calculate percentage change
  String _calculatePercentageChange() {
    if (_monthlySavings.length < 2) {
      return 'N/A'; // Not enough data
    }

    double latestMonth = _monthlySavings.last;
    double previousMonth = _monthlySavings[_monthlySavings.length - 2];

    if (previousMonth == 0) {
      if (latestMonth > 0) {
        return '+Inf%'; // Infinite increase from zero
      } else if (latestMonth < 0) {
        return '-Inf%'; // Infinite decrease from zero (unlikely in savings)
      } else {
        return '0.0%'; // Still zero
      }
    }

    double change = latestMonth - previousMonth;
    double percentage = (change / previousMonth) * 100;

    String sign = percentage >= 0 ? '+' : '-';
    return '$sign${percentage.abs().toStringAsFixed(1)}%';
  }

  // Method to determine color based on change
  Color _getChangeColor(String change) {
    if (change == 'N/A') return Colors.black54;
    if (change.startsWith('+')) return Colors.green;
    if (change.startsWith('-')) return Colors.red;
    return Colors.black54; // Default or zero change
  }

  // Method to get icon based on change
  IconData? _getChangeIcon(String change) {
    if (change == 'N/A') return null;
    if (change.startsWith('+') && change != '+Inf%') return Icons.arrow_upward;
    if (change.startsWith('-') && change != '-Inf%') {
      return Icons.arrow_downward;
    }
    return null; // No icon for N/A, 0%, +Inf%, -Inf%
  }

  // Method to handle adding the new amount
  void _addAmount() {
    if (_newAmount > 0) {
      setState(() {
        _savingAmount += _newAmount;

        // Update the last month's savings in the chart data
        if (_monthlySavings.isNotEmpty) {
          _monthlySavings[_monthlySavings.length - 1] += _newAmount;
          // Or if you want to add a new data point for the current "Add" action,
          // you'd need logic to determine the current month/period and add a new entry.
          // This simple example just adds to the last existing month.
        } else {
          // Handle case where monthlySavings is initially empty - maybe add the first entry
          // _monthlySavings.add(_newAmount);
          // _months.add('Month ${_monthlySavings.length}'); // Add a generic month label
        }

        // Clear the amount text field and reset the state variable
        _amountController.clear();
        _newAmount = 0.0;

        // Recalculate percentage of income saved if needed (requires total income)
        // _percentageOfIncome = (_savingAmount / totalIncome) * 100;
      });
    }
  }

  // Method to handle changing the goal
  void _changeGoal(String value) {
    double? parsedGoal = double.tryParse(value);
    if (parsedGoal != null) {
      setState(() {
        _savingsGoalAmount = parsedGoal;
      });
    }
    // Note: If the user clears the text field, parsedGoal will be null.
    // You might want to set _savingsGoalAmount to 0 or handle that case specifically.
  }

  @override
  Widget build(BuildContext context) {
    String percentageChange = _calculatePercentageChange();
    Color changeColor = _getChangeColor(percentageChange);
    IconData? changeIcon = _getChangeIcon(percentageChange);

    // Calculate goal progress using state variables
    double goalProgress = (_savingsGoalAmount > 0)
        ? (_savingAmount / _savingsGoalAmount).clamp(0.0, 1.0)
        : 0.0;
    String goalProgressPercentage = (goalProgress * 100).toStringAsFixed(1);

    return SafeArea(
      child: Padding(
        padding: mainPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainNavigationBar(),
              Gap(mainGap),
              // Amount Text Field
              MainTextField(
                title: 'Amount',
                hint: 'Enter amount to add',
                controller: _amountController,
                // Assign the controller
                onChanged: (value) {
                  _newAmount =
                      double.tryParse(value) ?? 0.0; // Update state variable
                },
                isAmount: true,
              ),
              Gap(secondaryGap),
              // Add Button
              MainButton(
                color: themeColor,
                width: double.infinity,
                onTap: _addAmount, // Call the _addAmount method on press
                child: Center(
                  child: Text(
                    'Add',
                    style: titleStyle.copyWith(color: Colors.white),
                  ),
                ),
              ),
              Gap(secondaryGap),
              // Goal Text Field
              MainTextField(
                title: 'Goal',
                hint: 'Enter your savings goal',
                controller: _goalController,
                // Assign the controller
                onChanged: _changeGoal,
                // Call the _changeGoal method on change
                isAmount: true,
              ),
              Gap(secondaryGap),
              // Savings Overview Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Saved:',
                        style: titleStyle,
                      ),
                      Text(
                        '$_savingAmount SAR', // Use state variable
                        style: secondaryStyle.copyWith(
                            color: Colors.green, fontSize: p2),
                      ),
                    ],
                  ),
                  Gap(secondaryGap),

                  // Monthly Savings Chart
                  Text(
                    'Monthly Savings Trend',
                    style: titleStyle,
                  ),
                  Gap(secondaryGap / 2),

                  MainButton(
                    // Assuming MainButton is a container in your design
                    height: 200,
                    child: _monthlySavings.isNotEmpty && _months.isNotEmpty
                        ? BarChart(
                            BarChartData(
                              alignment: BarChartAlignment.spaceAround,
                              // Recalculate maxY based on potentially updated _monthlySavings
                              maxY: _monthlySavings.isNotEmpty
                                  ? (_monthlySavings
                                          .reduce((a, b) => a > b ? a : b)) *
                                      1.2
                                  : 100,
                              barGroups: List.generate(
                                _monthlySavings.length,
                                (index) => BarChartGroupData(
                                  x: index,
                                  barRods: [
                                    BarChartRodData(
                                      toY: _monthlySavings[index],
                                      color: secondaryThemeColor,
                                      width: 16,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ],
                                ),
                              ),
                              titlesData: FlTitlesData(
                                show: true,
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget:
                                        (double value, TitleMeta meta) {
                                      final index = value.toInt();
                                      if (index >= 0 &&
                                          index < _months.length) {
                                        return SideTitleWidget(
                                          space: 4.0,
                                          meta: meta,
                                          child: Text(_months[index],
                                              style: secondaryStyle),
                                        );
                                      }
                                      return SideTitleWidget(
                                          space: 4.0,
                                          meta: meta,
                                          child: const SizedBox.shrink());
                                    },
                                    reservedSize: 20,
                                  ),
                                ),
                                leftTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              gridData: const FlGridData(show: false),
                              borderData: FlBorderData(show: false),
                              barTouchData: BarTouchData(enabled: false),
                            ),
                          )
                        : const Center(
                            child: Text('No monthly savings data available'),
                          ),
                  ),
                  Gap(secondaryGap),

                  // Percentage of Income Saved
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Percent of Income Saved:',
                        style: titleStyle,
                      ),
                      Text(
                        '${_percentageOfIncome.toStringAsFixed(1)}%',
                        style: secondaryStyle.copyWith(
                          fontSize: p2,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  Gap(secondaryGap),

                  // Monthly Change
                  Text(
                    'Monthly Change:',
                    style: titleStyle,
                  ),
                  Gap(secondaryGap),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'From previous month:',
                        style: secondaryStyle,
                      ),
                      Row(
                        children: [
                          if (changeIcon != null)
                            Icon(
                              changeIcon,
                              color: changeColor,
                              size: secondaryStyle.fontSize,
                            ),
                          Text(
                            percentageChange,
                            style: secondaryStyle.copyWith(
                              fontSize: p2,
                              color: changeColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Gap(secondaryGap),

                  // Savings Goal
                  Text(
                    'Savings Goal:',
                    style: titleStyle,
                  ),
                  Gap(secondaryGap),

                  Text(
                    widget.initialSavingsGoalTitle,
                    style: secondaryStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Gap(secondaryGap / 2),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Progress:',
                        style: secondaryStyle,
                      ),
                      Text(
                        '$goalProgressPercentage%',
                        style: secondaryStyle.copyWith(
                          color: Colors.purple,
                          fontSize: p2,
                        ),
                      ),
                    ],
                  ),
                  Gap(secondaryGap / 2),

                  LinearProgressIndicator(
                    value: goalProgress,
                    backgroundColor: Colors.grey[300],
                    color: secondaryThemeColor,
                    minHeight: 8.0,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  Gap(secondaryGap / 2),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$_savingAmount SAR',
                        style: secondaryStyle.copyWith(
                            fontSize: p2, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Goal: $_savingsGoalAmount SAR',
                        style: secondaryStyle.copyWith(fontSize: p2),
                      ),
                    ],
                  ),
                ],
              ),
              Gap(bottomGap)
            ],
          ),
        ),
      ),
    );
  }
}

class Investment extends StatelessWidget {
  final List<Map<String, String>> investmentList = [
    {'image': 'assets/images/investment/awaed.png', 'title': 'Awaed'},
    {'image': 'assets/images/investment/dinar.png', 'title': 'Dinar'},
    {'image': 'assets/images/investment/manafa.png', 'title': 'Manafa'},
    {
      'image': 'assets/images/investment/moi.png',
      'title': 'Ministry of\nInvestment'
    },
    {'image': 'assets/images/Bank/riyadh-bank.png', 'title': 'Riyadh Bank'},
    {'image': 'assets/images/Bank/al-rajhi.png', 'title': 'Al Rajhi'},
    {'image': 'assets/images/Bank/snb.png', 'title': 'Saudi National\nBank'},
  ];

  Investment({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainNavigationBar(),
            Gap(mainGap),
            Text('Investments', style: titleStyle),
            Gap(secondaryGap),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.0, // Adjust for item size
              ),
              shrinkWrap: true,
              itemCount: investmentList.length,
              // Number of items
              itemBuilder: (context, index) {
                return MainButton(
                    width: 110,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // investmentList[index].icon,
                        Image.asset(
                          investmentList[index]['image']!,
                          width: 40,
                          fit: imageFit,
                        ),
                        Text(
                          investmentList[index]['title']!,
                          textAlign: TextAlign.center,
                          style: secondaryStyle,
                        ),
                      ],
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Entrepreneurship extends StatelessWidget {
  final List<Map<String, dynamic>> investmentList = [
    {'icon': Icons.gamepad_outlined, 'title': 'Games'},
    {'icon': Icons.animation_outlined, 'title': 'Animation'},
    {'icon': Icons.publish_outlined, 'title': 'E-Publishing'},
    {'icon': Icons.account_box_outlined, 'title': 'E-Learning'},
    {'icon': Icons.devices, 'title': 'IOT'},
    {'icon': Icons.tablet_android, 'title': 'Smart Books'},
  ];

  Entrepreneurship({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainNavigationBar(),
            Gap(mainGap),
            Text('Investments', style: titleStyle),
            Gap(secondaryGap),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.0, // Adjust for item size
              ),
              shrinkWrap: true,
              itemCount: investmentList.length,
              // Number of items
              itemBuilder: (context, index) {
                return MainButton(
                    width: 110,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // investmentList[index].icon,
                        Icon(
                          investmentList[index]['icon']!,
                          color: themeColor,
                        ),
                        Text(
                          investmentList[index]['title']!,
                          textAlign: TextAlign.center,
                          style: secondaryStyle,
                        ),
                      ],
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
