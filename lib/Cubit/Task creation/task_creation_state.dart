part of 'task_creation_cubit.dart';

abstract class TaskCreationState {
  final String name;
  final String book;
  final String giftCard;
  final double amount;
  final DateTime dueDate;
  final bool isAmount;
  final List<Task> tasks;
  final int index;
  final bool isEditing;
  final int taskIndexToEdit;

  TaskCreationState({
    required this.name,
    required this.book,
    required this.giftCard,
    required this.amount,
    required this.dueDate,
    required this.isAmount,
    required this.tasks,
    required this.index,
    required this.isEditing,
    required this.taskIndexToEdit,
  });
}

class TaskCreationInitial extends TaskCreationState {
  TaskCreationInitial({
    required super.name,
    required super.book,
    required super.giftCard,
    required super.amount,
    required super.dueDate,
    required super.isAmount,
    required super.tasks,
    required super.index,
    required super.isEditing,
    required super.taskIndexToEdit,
  });
}
