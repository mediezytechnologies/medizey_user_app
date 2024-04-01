part of 'add_member_bloc.dart';

@immutable
sealed class AddMemberState {}

final class AddMemberInitial extends AddMemberState {}

class AddMemberLoadingState extends AddMemberState {}

class AddMemberLoadedState extends AddMemberState {
  final String successMessage;

  AddMemberLoadedState({required this.successMessage});
}

class AddMemberErrorState extends AddMemberState {
  final String errorMessage;

  AddMemberErrorState({required this.errorMessage});
}
