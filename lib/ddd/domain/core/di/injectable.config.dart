// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/add_member_image/add_member_image_bloc.dart'
    as _i28;
import '../../../application/add_members/add_members_bloc.dart' as _i9;
import '../../../application/edit_member/edit_member_bloc.dart' as _i29;
import '../../../application/edit_member_image/edit_member_image_bloc.dart'
    as _i30;
import '../../../application/firebase_login/firebase_login_bloc.dart' as _i14;
import '../../../application/get_docters/get_docters_bloc.dart' as _i31;
import '../../../application/get_fav_doctor/get_fav_doctor_bloc.dart' as _i19;
import '../../../application/get_recently_booked_doctor/get_recently_booked_doctor_bloc.dart'
    as _i32;
import '../../../application/rating/rating_bloc.dart' as _i33;
import '../../../application/search_doctor/search_doctor_bloc.dart' as _i34;
import '../../../application/user_location/user_location_bloc.dart' as _i35;
import '../../../infrastructure/add_member/add_member_impl.dart' as _i8;
import '../../../infrastructure/add_member_image/add_member_image_impl.dart'
    as _i6;
import '../../../infrastructure/edit_member/edit_member_impl.dart' as _i13;
import '../../../infrastructure/edit_member_image/edit_member_image_impl.dart'
    as _i11;
import '../../../infrastructure/firebase_service/firebase_auth_api.dart' as _i4;
import '../../../infrastructure/get_doctor/docters_service.dart' as _i16;
import '../../../infrastructure/get_fav_docters_service/get_fav_docters_service.dart'
    as _i18;
import '../../../infrastructure/get_recently_booked_doctors/get_recently_doctor_repo_impl.dart'
    as _i21;
import '../../../infrastructure/rating/rating_repo_impl.dart' as _i23;
import '../../../infrastructure/search_doctor/search_doctor_repo_impl.dart'
    as _i25;
import '../../../infrastructure/user_location/user_location_impl.dart' as _i27;
import '../../add_member/add_member_service.dart' as _i7;
import '../../add_member_image/add_image_impl.dart' as _i5;
import '../../edit_member/edit_member_service.dart' as _i12;
import '../../edit_member_image/edit_member_image_service.dart' as _i10;
import '../../firebase_login/firebase_login_api_impl.dart' as _i3;
import '../../get_doctors/docters_impl.dart' as _i15;
import '../../get_fav_model/get_fav_impl.dart' as _i17;
import '../../get_recently_booked_doctors/get_recently_booked_doctors_repository.dart'
    as _i20;
import '../../rating/rating_repository.dart' as _i22;
import '../../search_doctor/search_doctor_repository.dart' as _i24;
import '../../user_location/user_location_impl.dart'
    as _i26; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AddFirebaseLogin>(() => _i4.FirebaseLoginImpl());
  gh.lazySingleton<_i5.AddMemberImageRepo>(() => _i6.RegisterServiceImpl());
  gh.lazySingleton<_i7.AddMemberRepo>(() => _i8.RegisterServiceImpl());
  gh.factory<_i9.AddMembersBloc>(
      () => _i9.AddMembersBloc(get<_i7.AddMemberRepo>()));
  gh.lazySingleton<_i10.EditMemberImageRepo>(
      () => _i11.EditMemberImageServiceImpl());
  gh.lazySingleton<_i12.EditMemberRepo>(() => _i13.RegisterServiceImpl());
  gh.factory<_i14.FirebaseLoginBloc>(
      () => _i14.FirebaseLoginBloc(get<_i3.AddFirebaseLogin>()));
  gh.lazySingleton<_i15.GetDoctersRepo>(() => _i16.GetDoctorsImpl());
  gh.lazySingleton<_i17.GetFavDoctersRepo>(() => _i18.GetDoctorsImpl());
  gh.factory<_i19.GetFavDoctorBloc>(
      () => _i19.GetFavDoctorBloc(get<_i17.GetFavDoctersRepo>()));
  gh.lazySingleton<_i20.GetRecentlyBookedDoctorRepository>(
      () => _i21.GetRecentlyBookedDoctorsImpl());
  gh.lazySingleton<_i22.RatingRepository>(() => _i23.RatingRepoImpl());
  gh.lazySingleton<_i24.SearchDoctorRepository>(
      () => _i25.SearchDoctorRepoImpl());
  gh.lazySingleton<_i26.UserLocationRepo>(() => _i27.UserLoacationImpl());
  gh.factory<_i28.AddMemberImageBloc>(
      () => _i28.AddMemberImageBloc(get<_i5.AddMemberImageRepo>()));
  gh.factory<_i29.EditMemberBloc>(
      () => _i29.EditMemberBloc(get<_i12.EditMemberRepo>()));
  gh.factory<_i30.EditMemberImageBloc>(
      () => _i30.EditMemberImageBloc(get<_i10.EditMemberImageRepo>()));
  gh.factory<_i31.GetDoctersBloc>(
      () => _i31.GetDoctersBloc(get<_i15.GetDoctersRepo>()));
  gh.factory<_i32.GetRecentlyBookedDoctorBloc>(() =>
      _i32.GetRecentlyBookedDoctorBloc(
          get<_i20.GetRecentlyBookedDoctorRepository>()));
  gh.factory<_i33.RatingBloc>(
      () => _i33.RatingBloc(get<_i22.RatingRepository>()));
  gh.factory<_i34.SearchDoctorBloc>(
      () => _i34.SearchDoctorBloc(get<_i24.SearchDoctorRepository>()));
  gh.factory<_i35.UserLocationBloc>(
      () => _i35.UserLocationBloc(get<_i26.UserLocationRepo>()));
  return get;
}
