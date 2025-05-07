part of 'balance_cubit.dart';

@immutable
sealed class BalanceState {
  const BalanceState(
      {required this.fatherBalance,
      required this.studentBalance,
      required this.pendingBalance});

  final double fatherBalance;
  final double studentBalance;
  final double pendingBalance;
}

final class BalanceInitial extends BalanceState {
  const BalanceInitial(
      {required super.fatherBalance,
      required super.studentBalance,
      required super.pendingBalance});
}
