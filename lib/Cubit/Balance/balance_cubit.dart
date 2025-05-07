import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit()
      : super(BalanceInitial(
            fatherBalance: 0, studentBalance: 250, pendingBalance: 0));

  void balance({
    double? fatherBalance,
    double? studentBalance,
    double? pendingBalance,
  }) {
    emit(BalanceInitial(
      fatherBalance: fatherBalance ?? state.fatherBalance,
      studentBalance: studentBalance ?? state.studentBalance,
      pendingBalance: pendingBalance ?? state.pendingBalance,
    ));
  }
}
