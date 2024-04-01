part of 'auto_fetch_bloc.dart';

@immutable
sealed class AutoFetchState {}

final class AutoFetchInitial extends AutoFetchState {}

class AutoFetchLoading extends AutoFetchState {}

class AutoFetchLoaded extends AutoFetchState {
  final AutoFetchModel autoFetchModel;

  AutoFetchLoaded({required this.autoFetchModel});
}

class AutoFetchError extends AutoFetchState {
  final String errorMessage;

  AutoFetchError({required this.errorMessage});
}
