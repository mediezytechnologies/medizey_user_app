import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/get_recently_booked_doctors/model/recently_booked_doctor.dart';
import '../../domain/get_recently_booked_doctors/get_recently_booked_doctors_repository.dart';
part 'get_recently_booked_doctor_event.dart';
part 'get_recently_booked_doctor_state.dart';
part 'get_recently_booked_doctor_bloc.freezed.dart';

@injectable
class GetRecentlyBookedDoctorBloc
    extends Bloc<GetRecentlyBookedDoctorEvent, GetRecentlyBookedDoctorState> {
  final GetRecentlyBookedDoctorRepository getRecentlyBookedDoctorRepository;
  // List<RecentlyBookedDoctor> cachedRecentlyBookedDoctors = [];
  GetRecentlyBookedDoctorBloc(this.getRecentlyBookedDoctorRepository)
      : super(GetRecentlyBookedDoctorState.initial()) {
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

      // if (cachedRecentlyBookedDoctors.isNotEmpty) {
      //   emit(state.copyWith(
      //     isloding: false,
      //     isError: false,
      //     message: state.message,
      //     status: state.status,
      //     model: cachedRecentlyBookedDoctors,
      //   ));
      //   return;
      // }

      final getRecentlyDoctorResult = await getRecentlyBookedDoctorRepository
          .getRecentlyBookedDoctorsRepo();
      emit(getRecentlyDoctorResult.fold(
          (l) => state.copyWith(
                isloding: false,
                isError: true,
                message: l.message!,
                model: [],
                status: false,
              ), (r) {
        // cachedRecentlyBookedDoctors = r;
        return state.copyWith(
          isloding: false,
          isError: false,
          message: state.message,
          status: state.status,
          model: r,
        );
      }));
    });

    // on<_GetRecentlyBookedDocterForcedEvent>((event, emit) async {
    //   final getRecentlyDoctorResult = await getRecentlyBookedDoctorRepository
    //       .getRecentlyBookedDoctorsRepo();
    //   cachedRecentlyBookedDoctors = [];
    //   emit(getRecentlyDoctorResult.fold(
    //     (l) => state.copyWith(
    //       isloding: false,
    //       isError: true,
    //       message: l.message!,
    //       model: [],
    //       status: false,
    //     ),
    //     (r) {
    //       cachedRecentlyBookedDoctors = r;
    //       return state.copyWith(
    //         isloding: false,
    //         isError: false,
    //         message: state.message,
    //         status: state.status,
    //         model: r,
    //       );
    //     },
    //   ));
    // });

    on<_ChangeFav>((event, emit) {
      final updatedDoctors = state.model.map((doctor) {
        if (doctor.id == event.favId) {
          doctor.favoriteStatus = doctor.favoriteStatus == 1 ? 0 : 1;
        }
        return doctor;
      }).toList();
      emit(state.copyWith(model: updatedDoctors));
    });
  }
}
