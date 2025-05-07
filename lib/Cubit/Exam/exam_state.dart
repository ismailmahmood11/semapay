part of 'exam_cubit.dart';

@immutable
sealed class ExamState {
  const ExamState({
    required this.index,
    required this.selectedOption,
    required this.isCompleted,
  });

  final int index;
  final int selectedOption;
  final List<int> isCompleted;
}

final class ExamInitial extends ExamState {
  const ExamInitial(
      {required super.index,
      required super.selectedOption,
      required super.isCompleted});
}
