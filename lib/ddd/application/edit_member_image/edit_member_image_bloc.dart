import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/add_member_image/model/add_member_image.dart';
import 'package:mediezy_user/ddd/domain/core/failures/main_failure.dart';
import 'package:mediezy_user/ddd/domain/edit_member_image/edit_member_image_service.dart';
part 'edit_member_image_event.dart';
part 'edit_member_image_state.dart';
part 'edit_member_image_bloc.freezed.dart';

@injectable
class EditMemberImageBloc
    extends Bloc<EditMemberImageEvent, EditMemberImageState> {
  final EditMemberImageRepo editMemberImageRepo;
  EditMemberImageBloc(this.editMemberImageRepo)
      : super(EditMemberImageState.initial()) {
    on<_Started>((event, emit) async {
      emit(state.copyWith(
          isloding: true, registerFaileurOrSuccessOption: none()));
      final Either<MainFailure, AddMemberImags?> editMemberImagOption =
          await editMemberImageRepo.getEditmemberImageData(
              event.imagePath, event.patientId);

      emit(
        editMemberImagOption.fold(
          (failure) => state.copyWith(
            isloding: true,
            registerFaileurOrSuccessOption: some(
              left(
                failure,
              ),
            ),
          ),
          (success) => state.copyWith(
            isloding: false,
            model: success,
            registerFaileurOrSuccessOption: some(
              right(
                success!,
              ),
            ),
          ),
        ),
      );
    });
  }
}
