import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/error_model/error_model.dart';
import '../../domain/user_location/model/user_location_model.dart';
import '../../domain/user_location/user_location_impl.dart';
part 'user_location_event.dart';
part 'user_location_state.dart';
part 'user_location_bloc.freezed.dart';

@injectable
class UserLocationBloc extends Bloc<UserLocationEvent, UserLocationState> {
  final UserLocationRepo userLocationRepo;
  UserLocationBloc(this.userLocationRepo) : super(UserLocationState.initial()) {
    on<_Started>((event, emit) async {
      emit(
        const UserLocationState(
            isloding: true, isError: false, message: "", status: false),
      );
      log(emit.toString());
      final addMemberResult = await userLocationRepo.userLocation(
          event.latitude,
          event.longitude,
          event.district,
          event.city,
          event.locationAddress);

      final state = addMemberResult.fold((ErrorModel error) {
        return UserLocationState(
            isloding: false,
            isError: true,
            message: error.message!,
            status: false);
      }, (UserLocationModel? success) {
        return UserLocationState(
            isloding: false,
            isError: false,
            message: success!.message!,
            status: success.status!);
      });
      emit(state);
    });
  }
}
