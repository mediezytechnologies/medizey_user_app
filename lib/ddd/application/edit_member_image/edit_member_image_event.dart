part of 'edit_member_image_bloc.dart';

@freezed
class EditMemberImageEvent with _$EditMemberImageEvent {
  const factory EditMemberImageEvent.started(String imagePath,String patientId) = _Started;
}