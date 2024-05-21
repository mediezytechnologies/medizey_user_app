part of 'search_doctor_bloc.dart';

@freezed
class SearchDoctorState with _$SearchDoctorState {
  const factory SearchDoctorState(
      {required bool isloding,
      required List<SearchDoctor> model,
      required bool isError,
      required String message,
      required bool status,
      required int favId}) = _Initial;

  factory SearchDoctorState.initial() => const SearchDoctorState(
        isloding: false,
        isError: false,
        message: '',
        status: false,
        model: [],
        favId: 0,
      );
}
