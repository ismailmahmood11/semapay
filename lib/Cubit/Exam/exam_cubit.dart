import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'exam_state.dart';

class ExamCubit extends Cubit<ExamState> {
  ExamCubit()
      : super(ExamInitial(index: 0, selectedOption: 0, isCompleted: []));

  void exam({int? index, int? selectedOption, List<int>? isCompleted}) {
    emit(ExamInitial(
      index: index ?? state.index,
      selectedOption: selectedOption ?? state.selectedOption,
      isCompleted: isCompleted ?? state.isCompleted,
    ));
  }

  void addCompletedIndex(int index) {
    final updatedList = List<int>.from(state.isCompleted);
    if (!updatedList.contains(index)) {
      updatedList.add(index);
      emit(ExamInitial(
        index: state.index,
        selectedOption: state.selectedOption,
        isCompleted: updatedList,
      ));
    }
  }
}
