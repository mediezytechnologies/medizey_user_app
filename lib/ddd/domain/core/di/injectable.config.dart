// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/add_member_image/add_member_image_bloc.dart'
    as _i12;
import '../../../application/add_members/add_members_bloc.dart' as _i7;
import '../../../application/edit_member/edit_member_bloc.dart' as _i13;
import '../../../application/user_location/user_location_bloc.dart' as _i14;
import '../../../infrastructure/add_member/add_member_impl.dart' as _i6;
import '../../../infrastructure/add_member_image/add_member_image_impl.dart'
    as _i4;
import '../../../infrastructure/edit_member/edit_member_impl.dart' as _i9;
import '../../../infrastructure/user_location/user_location_impl.dart' as _i11;
import '../../add_member/add_member_service.dart' as _i5;
import '../../add_member_image/add_image_impl.dart' as _i3;
import '../../edit_member/edit_member_service.dart' as _i8;
import '../../user_location/user_location_impl.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.AddMemberImageRepo>(() => _i4.RegisterServiceImpl());
  gh.lazySingleton<_i5.AddMemberRepo>(() => _i6.RegisterServiceImpl());
  gh.factory<_i7.AddMembersBloc>(
      () => _i7.AddMembersBloc(get<_i5.AddMemberRepo>()));
  gh.lazySingleton<_i8.EditMemberRepo>(() => _i9.RegisterServiceImpl());
  gh.lazySingleton<_i10.UserLocationRepo>(() => _i11.UserLoacationImpl());
  gh.factory<_i12.AddMemberImageBloc>(
      () => _i12.AddMemberImageBloc(get<_i3.AddMemberImageRepo>()));
  gh.factory<_i13.EditMemberBloc>(
      () => _i13.EditMemberBloc(get<_i8.EditMemberRepo>()));
  gh.factory<_i14.UserLocationBloc>(
      () => _i14.UserLocationBloc(get<_i10.UserLocationRepo>()));
  return get;
}
