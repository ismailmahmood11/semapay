import 'package:bloc/bloc.dart';

part 'task_creation_state.dart';

class TaskCreationCubit extends Cubit<TaskCreationState> {
  TaskCreationCubit()
      : super(
          TaskCreationInitial(
              name: '',
              book: '',
              giftCard: 'assets/images/Gift Cards/ps.png',
              amount: 0,
              dueDate: DateTime.now().add(Duration(days: 1)),
              tasks: [],
              isAmount: true,
              index: 0,
              isEditing: false,
              taskIndexToEdit: -1,
              isKids: false),
        );

  void updateTask({
    String? name,
    String? book,
    String? giftCard,
    double? amount,
    DateTime? dueDate,
    bool? isAmount,
    bool? isKids,
    int? index,
  }) {
    emit(TaskCreationInitial(
      name: name ?? state.name,
      amount: amount ?? state.amount,
      book: book ?? state.book,
      dueDate: dueDate ?? state.dueDate,
      isAmount: isAmount ?? state.isAmount,
      giftCard: giftCard ?? state.giftCard,
      tasks: state.tasks,
      index: index ?? state.index,
      isEditing: state.isEditing,
      taskIndexToEdit: state.taskIndexToEdit,
      isKids: isKids ?? state.isKids,
    ));
  }

  void resetTask() {
    emit(TaskCreationInitial(
      name: '',
      giftCard: 'assets/images/Gift Cards/ps.png',
      book: '',
      amount: 0,
      dueDate: DateTime.now().add(Duration(days: 1)),
      isAmount: true,
      tasks: state.tasks,
      index: state.index,
      isEditing: false,
      taskIndexToEdit: -1,
      isKids: state.isKids,
    ));
  }

  void updateDueDate(DateTime newDate) {
    emit(TaskCreationInitial(
      name: state.name,
      amount: state.amount,
      book: state.book,
      isAmount: state.isAmount,
      giftCard: state.giftCard,
      dueDate: newDate,
      tasks: state.tasks,
      index: state.index,
      isEditing: state.isEditing,
      taskIndexToEdit: state.taskIndexToEdit,
      isKids: state.isKids,
    ));
  }

  void updateTaskList(List<Task> newTasks) {
    emit(TaskCreationInitial(
      name: state.name,
      amount: state.amount,
      book: state.book,
      dueDate: state.dueDate,
      isAmount: state.isAmount,
      giftCard: state.giftCard,
      tasks: newTasks,
      index: state.index,
      isEditing: state.isEditing,
      isKids: state.isKids,
      taskIndexToEdit: state.taskIndexToEdit,
    ));
  }

  void addTask(Task newTask) {
    final updatedTasks = List<Task>.from(state.tasks)..add(newTask);
    emit(TaskCreationInitial(
      name: state.name,
      amount: state.amount,
      book: state.book,
      dueDate: state.dueDate,
      isAmount: state.isAmount,
      giftCard: state.giftCard,
      tasks: updatedTasks,
      index: state.index,
      isEditing: false,
      isKids: state.isKids,
      taskIndexToEdit: -1,
    ));
  }

  void editTask(int index, Task editedTask) {
    final updatedTasks = List<Task>.from(state.tasks);
    if (index >= 0 && index < updatedTasks.length) {
      updatedTasks[index] = editedTask;
    }

    emit(TaskCreationInitial(
      name: '',
      amount: 0,
      book: '',
      dueDate: DateTime.now().add(Duration(days: 1)),
      isAmount: true,
      giftCard: 'assets/images/Gift Cards/ps.png',
      tasks: updatedTasks,
      index: state.index,
      isEditing: false,
      isKids: state.isKids,
      taskIndexToEdit: -1,
    ));
  }

  void startEditing(int index) {
    final task = state.tasks[index];
    emit(TaskCreationInitial(
      name: task.name,
      amount: task.amount,
      book: task.book,
      dueDate: task.dueDate,
      isAmount: task.isAmount,
      giftCard: task.giftCard,
      tasks: state.tasks,
      index: state.index,
      isEditing: true,
      isKids: state.isKids,
      taskIndexToEdit: index,
    ));
  }

  void removeTask(Task taskToRemove) {
    final updatedTasks = List<Task>.from(state.tasks)..remove(taskToRemove);
    emit(TaskCreationInitial(
      name: state.name,
      amount: state.amount,
      book: state.book,
      dueDate: state.dueDate,
      isAmount: state.isAmount,
      giftCard: state.giftCard,
      tasks: updatedTasks,
      index: state.index,
      isEditing: state.isEditing,
      isKids: state.isKids,
      taskIndexToEdit: state.taskIndexToEdit,
    ));
  }
}

class Task {
  final String name;
  final String book;
  final String giftCard;
  final double amount;
  final DateTime dueDate;
  final bool isAmount;

  Task({
    required this.name,
    required this.amount,
    required this.book,
    required this.dueDate,
    required this.isAmount,
    required this.giftCard,
  });
}
