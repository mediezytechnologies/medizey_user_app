import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/get_fav_model/get_fav_impl.dart';
import '../../domain/get_fav_model/model/favorite_doctor.dart';
part 'get_fav_doctor_event.dart';
part 'get_fav_doctor_state.dart';
part 'get_fav_doctor_bloc.freezed.dart';

@injectable
class GetFavDoctorBloc extends Bloc<GetFavDoctorEvent, GetFavDoctorState> {
  GetFavDoctersRepo getFavDoctersRepo;
  GetFavDoctorBloc(this.getFavDoctersRepo)
      : super(GetFavDoctorState.initial()) {
    on<_Started>((event, emit) async {
      if (event.isLoading) {
        emit(state.copyWith(
          isloding: true,
          isError: false,
          message: "",
          status: false,
          model: [],
        ));
      }

      final getFavDoctorResult = await getFavDoctersRepo.getFavDocRepo();
      emit(getFavDoctorResult.fold(
          (l) => state.copyWith(
                isloding: false,
                isError: true,
                message: l.message!,
                model: [],
                status: false,
              ), (r) {
        return state.copyWith(
          isloding: false,
          isError: false,
          message: state.message,
          status: state.status,
          model: r,
        );
      }));
    });

    on<_ChangeFav>((event, emit) {
      final updatedFavDoctors = state.model.map((doctor) {
        if (doctor.id == event.favId) {
          doctor.favoriteStatus = doctor.favoriteStatus == 1 ? 0 : 1;
        }
        return doctor;
      }).toList();
      emit(state.copyWith(model: updatedFavDoctors));
    });
  }
}
