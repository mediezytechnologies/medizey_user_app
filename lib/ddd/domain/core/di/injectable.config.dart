// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/add_member_image/add_member_image_bloc.dart'
    as _i36;
import '../../../application/add_members/add_members_bloc.dart' as _i9;
import '../../../application/edit_member/edit_member_bloc.dart' as _i37;
import '../../../application/edit_member_image/edit_member_image_bloc.dart'
    as _i38;
import '../../../application/firebase_login/firebase_login_bloc.dart' as _i16;
import '../../../application/forgot_password/forget_password_first/forget_password_first_bloc.dart'
    as _i39;
import '../../../application/forgot_password/forget_password_three/forget_password_three_bloc.dart'
    as _i40;
import '../../../application/forgot_password/forget_password_two/forget_password_two_bloc.dart'
    as _i41;
import '../../../application/get_docters/get_docters_bloc.dart' as _i42;
import '../../../application/get_fav_doctor/get_fav_doctor_bloc.dart' as _i23;
import '../../../application/get_recently_booked_doctor/get_recently_booked_doctor_bloc.dart'
    as _i45;
import '../../../application/notification_token/notificatio_token_bloc.dart'
    as _i26;
import '../../../application/questionare/get_questionare_symptom/get_questionare_symptom_bloc_bloc.dart'
    as _i43;
import '../../../application/questionare/get_questions/get_questions_bloc.dart'
    as _i44;
import '../../../application/questionare/submit_answer/submit_answer_bloc.dart'
    as _i33;
import '../../../application/rating/rating_bloc.dart' as _i46;
import '../../../application/rating_post/rating_post_bloc.dart' as _i47;
import '../../../application/search_doctor/search_doctor_bloc.dart' as _i48;
import '../../../application/user_location/user_location_bloc.dart' as _i49;
import '../../../infrastructure/add_member/add_member_impl.dart' as _i8;
import '../../../infrastructure/add_member_image/add_member_image_impl.dart'
    as _i6;
import '../../../infrastructure/edit_member/edit_member_impl.dart' as _i13;
import '../../../infrastructure/edit_member_image/edit_member_image_impl.dart'
    as _i11;
import '../../../infrastructure/fcm_token/fcm_token_impl.dart' as _i15;
import '../../../infrastructure/firebase_service/firebase_auth_api.dart' as _i4;
import '../../../infrastructure/forgot_password/forgot_password_repo_impl.dart'
    as _i18;
import '../../../infrastructure/get_doctor/docters_service.dart' as _i20;
import '../../../infrastructure/get_fav_docters_service/get_fav_docters_service.dart'
    as _i22;
import '../../../infrastructure/get_recently_booked_doctors/get_recently_doctor_repo_impl.dart'
    as _i25;
import '../../../infrastructure/questionare/questionare_repo_impl.dart' as _i28;
import '../../../infrastructure/rating/rating_repo_impl.dart' as _i30;
import '../../../infrastructure/search_doctor/search_doctor_repo_impl.dart'
    as _i32;
import '../../../infrastructure/user_location/user_location_impl.dart' as _i35;
import '../../add_member/add_member_service.dart' as _i7;
import '../../add_member_image/add_image_impl.dart' as _i5;
import '../../edit_member/edit_member_service.dart' as _i12;
import '../../edit_member_image/edit_member_image_service.dart' as _i10;
import '../../fcmToken/fcmToken_service.dart' as _i14;
import '../../firebase_login/firebase_login_api_impl.dart' as _i3;
import '../../forgot_password/forgot_password_repository.dart' as _i17;
import '../../get_doctors/docters_impl.dart' as _i19;
import '../../get_fav_model/get_fav_impl.dart' as _i21;
import '../../get_recently_booked_doctors/get_recently_booked_doctors_repository.dart'
    as _i24;
import '../../questionare/questionare_repository.dart' as _i27;
import '../../rating/rating_repository.dart' as _i29;
import '../../search_doctor/search_doctor_repository.dart' as _i31;
import '../../user_location/user_location_impl.dart'
    as _i34; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i14.FccmTokenRepo>(() => _i15.FcmTokenImpl());
  gh.factory<_i16.FirebaseLoginBloc>(
      () => _i16.FirebaseLoginBloc(get<_i3.AddFirebaseLogin>()));
  gh.lazySingleton<_i17.ForgotPasswordRepository>(
      () => _i18.ForgotPasswordRepoImpl());
  gh.lazySingleton<_i19.GetDoctersRepo>(() => _i20.GetDoctorsImpl());
  gh.lazySingleton<_i21.GetFavDoctersRepo>(() => _i22.GetDoctorsImpl());
  gh.factory<_i23.GetFavDoctorBloc>(
      () => _i23.GetFavDoctorBloc(get<_i21.GetFavDoctersRepo>()));
  gh.lazySingleton<_i24.GetRecentlyBookedDoctorRepository>(
      () => _i25.GetRecentlyBookedDoctorsImpl());
  gh.factory<_i26.NotificatioTokenBloc>(
      () => _i26.NotificatioTokenBloc(get<_i14.FccmTokenRepo>()));
  gh.lazySingleton<_i27.QuestionareRepository>(
      () => _i28.QuestionareRepoImpl());
  gh.lazySingleton<_i29.RatingRepository>(() => _i30.RatingRepoImpl());
  gh.lazySingleton<_i31.SearchDoctorRepository>(
      () => _i32.SearchDoctorRepoImpl());
  gh.factory<_i33.SubmitAnswerBloc>(
      () => _i33.SubmitAnswerBloc(get<_i27.QuestionareRepository>()));
  gh.lazySingleton<_i34.UserLocationRepo>(() => _i35.UserLoacationImpl());
  gh.factory<_i36.AddMemberImageBloc>(
      () => _i36.AddMemberImageBloc(get<_i5.AddMemberImageRepo>()));
  gh.factory<_i37.EditMemberBloc>(
      () => _i37.EditMemberBloc(get<_i12.EditMemberRepo>()));
  gh.factory<_i38.EditMemberImageBloc>(
      () => _i38.EditMemberImageBloc(get<_i10.EditMemberImageRepo>()));
  gh.factory<_i39.ForgetPasswordFirstBloc>(
      () => _i39.ForgetPasswordFirstBloc(get<_i17.ForgotPasswordRepository>()));
  gh.factory<_i40.ForgetPasswordThreeBloc>(
      () => _i40.ForgetPasswordThreeBloc(get<_i17.ForgotPasswordRepository>()));
  gh.factory<_i41.ForgetPasswordTwoBloc>(
      () => _i41.ForgetPasswordTwoBloc(get<_i17.ForgotPasswordRepository>()));
  gh.factory<_i42.GetDoctersBloc>(
      () => _i42.GetDoctersBloc(get<_i19.GetDoctersRepo>()));
  gh.factory<_i43.GetQuestionareSymptomBlocBloc>(() =>
      _i43.GetQuestionareSymptomBlocBloc(get<_i27.QuestionareRepository>()));
  gh.factory<_i44.GetQuestionsBloc>(
      () => _i44.GetQuestionsBloc(get<_i27.QuestionareRepository>()));
  gh.factory<_i45.GetRecentlyBookedDoctorBloc>(() =>
      _i45.GetRecentlyBookedDoctorBloc(
          get<_i24.GetRecentlyBookedDoctorRepository>()));
  gh.factory<_i46.RatingBloc>(
      () => _i46.RatingBloc(get<_i29.RatingRepository>()));
  gh.factory<_i47.RatingPostBloc>(
      () => _i47.RatingPostBloc(get<_i29.RatingRepository>()));
  gh.factory<_i48.SearchDoctorBloc>(
      () => _i48.SearchDoctorBloc(get<_i31.SearchDoctorRepository>()));
  gh.factory<_i49.UserLocationBloc>(
      () => _i49.UserLocationBloc(get<_i34.UserLocationRepo>()));
  return get;
}
