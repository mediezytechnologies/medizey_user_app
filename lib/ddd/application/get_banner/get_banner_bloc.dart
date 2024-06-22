import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/get_banner/model/get_banner_model.dart';
import '../../domain/get_banner/get_banner_repository.dart';
part 'get_banner_event.dart';
part 'get_banner_state.dart';
part 'get_banner_bloc.freezed.dart';

// @injectable
// class GetBannerBloc extends Bloc<GetBannerEvent, GetBannerState> {
//   final GetBannerRepository getBannerRepository;
//   GetBannerBloc(this.getBannerRepository) : super(GetBannerState.initial()) {
//     on<_FetchBanner>((event, emit) async {
//       emit(
//         const GetBannerState(
//           isloding: true,
//           isError: false,
//           message: '',
//           status: false,
//         ),
//       );
//       final bannerResult =
//           await getBannerRepository.getBannerRepo(event.bannerId);
//       emit(bannerResult.fold(
//           (l) => state.copyWith(
//                 isloding: false,
//                 isError: true,
//                 message: l.message!,
//                 status: false,
//               ), (r) {
//         return state.copyWith(
//           isloding: false,
//           isError: false,
//           message: state.message,
//           status: state.status,
//           model: r,
//         );
//       }));
//     });
//   }
// }


@injectable
class GetBannerBloc extends Bloc<GetBannerEvent, GetBannerState> {
  final GetBannerRepository getBannerRepository;
  GetBannerBloc(this.getBannerRepository) : super(GetBannerState.initial()) {
    on<_FetchBanner>((event, emit) async {
      // If data is already cached, don't fetch again
      if (state.cached && state.model != null) {
        return;
      }

      emit(state.copyWith(
        isLoading: true,
        isError: false,
        message: '',
        status: false,
      ));

      final bannerResult =
          await getBannerRepository.getBannerRepo(event.bannerId);

      emit(bannerResult.fold(
        (l) => state.copyWith(
          isLoading: false,
          isError: true,
          message: l.message!,
          status: false,
        ),
        (r) => state.copyWith(
          isLoading: false,
          isError: false,
          message: state.message,
          status: state.status,
          model: r,
          cached: true, // Set cached to true when we get data
        ),
      ));
    });
  }
}
