part of 'add_member_image_bloc.dart';

@freezed
class AddMemberImageEvent with _$AddMemberImageEvent {
  const factory AddMemberImageEvent.started(
    String imagePath,
  ) = _Started;
}
