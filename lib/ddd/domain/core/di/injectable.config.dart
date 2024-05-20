// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/add_member_image/add_member_image_bloc.dart'
    as _i17;
import '../../../application/add_members/add_members_bloc.dart' as _i9;
import '../../../application/edit_member/edit_member_bloc.dart' as _i18;
import '../../../application/edit_member_image/edit_member_image_bloc.dart'
    as _i19;
import '../../../application/firebase_login/firebase_login_bloc.dart' as _i14;
import '../../../application/user_location/user_location_bloc.dart' as _i20;
import '../../../firebase_service/firebase_auth_api.dart' as _i4;
import '../../../infrastructure/add_member/add_member_impl.dart' as _i8;
import '../../../infrastructure/add_member_image/add_member_image_impl.dart'
    as _i6;
import '../../../infrastructure/edit_member/edit_member_impl.dart' as _i13;
import '../../../infrastructure/edit_member_image/edit_member_image_impl.dart'
    as _i11;
import '../../../infrastructure/user_location/user_location_impl.dart' as _i16;
import '../../add_member/add_member_service.dart' as _i7;
import '../../add_member/firebase_login/firebase_login_api_impl.dart' as _i3;
import '../../add_member_image/add_image_impl.dart' as _i5;
import '../../edit_member/edit_member_service.dart' as _i12;
import '../../edit_member_image/edit_member_image_service.dart' as _i10;
import '../../user_location/user_location_impl.dart'
    as _i15; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i15.UserLocationRepo>(() => _i16.UserLoacationImpl());
  gh.factory<_i17.AddMemberImageBloc>(
      () => _i17.AddMemberImageBloc(get<_i5.AddMemberImageRepo>()));
  gh.factory<_i18.EditMemberBloc>(
      () => _i18.EditMemberBloc(get<_i12.EditMemberRepo>()));
  gh.factory<_i19.EditMemberImageBloc>(
      () => _i19.EditMemberImageBloc(get<_i10.EditMemberImageRepo>()));
  gh.factory<_i20.UserLocationBloc>(
      () => _i20.UserLocationBloc(get<_i15.UserLocationRepo>()));
  return get;
}
