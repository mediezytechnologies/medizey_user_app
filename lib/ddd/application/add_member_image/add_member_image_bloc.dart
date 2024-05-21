import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/add_member_image/add_image_impl.dart';
import '../../domain/add_member_image/model/add_member_image.dart';
import '../../domain/core/failures/main_failure.dart';
part 'add_member_image_event.dart';
part 'add_member_image_state.dart';
part 'add_member_image_bloc.freezed.dart';

@injectable
class AddMemberImageBloc
    extends Bloc<AddMemberImageEvent, AddMemberImageState> {
  final AddMemberImageRepo addMemberImageRepo;
  AddMemberImageBloc(this.addMemberImageRepo)
      : super(AddMemberImageState.initial()) {
    on<_Started>((event, emit) async {
      emit(state.copyWith(
          isloding: true, registerFaileurOrSuccessOption: none()));
      log(emit.toString());
      final Either<MainFailure, AddMemberImags?> addMemberImagOption =
          await addMemberImageRepo.getmemberImaageData(event.imagePath);
      log("${addMemberImagOption.toString()} ======");
      emit(
        addMemberImagOption.fold(
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
