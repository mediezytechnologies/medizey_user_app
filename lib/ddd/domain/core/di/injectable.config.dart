// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/add_member_image/add_member_image_bloc.dart'
    as _i16;
import '../../../application/add_members/add_members_bloc.dart' as _i7;
import '../../../application/edit_member/edit_member_bloc.dart' as _i17;
import '../../../application/edit_member_image/edit_member_image_bloc.dart'
    as _i18;
import '../../../application/get_docters/get_docters_bloc.dart' as _i19;
import '../../../application/user_location/user_location_bloc.dart' as _i20;
import '../../../infrastructure/add_member/add_member_impl.dart' as _i6;
import '../../../infrastructure/add_member_image/add_member_image_impl.dart'
    as _i4;
import '../../../infrastructure/docters_service/docters_service.dart' as _i13;
import '../../../infrastructure/edit_member/edit_member_impl.dart' as _i11;
import '../../../infrastructure/edit_member_image/edit_member_image_impl.dart'
    as _i9;
import '../../../infrastructure/user_location/user_location_impl.dart' as _i15;
import '../../add_member/add_member_service.dart' as _i5;
import '../../add_member_image/add_image_impl.dart' as _i3;
import '../../docters_model/docters_impl.dart' as _i12;
import '../../edit_member/edit_member_service.dart' as _i10;
import '../../edit_member_image/edit_member_image_service.dart' as _i8;
import '../../user_location/user_location_impl.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i8.EditMemberImageRepo>(
      () => _i9.EditMemberImageServiceImpl());
  gh.lazySingleton<_i10.EditMemberRepo>(() => _i11.RegisterServiceImpl());
  gh.lazySingleton<_i12.GetDoctersRepo>(() => _i13.GetDoctorsImpl());
  gh.lazySingleton<_i14.UserLocationRepo>(() => _i15.UserLoacationImpl());
  gh.factory<_i16.AddMemberImageBloc>(
      () => _i16.AddMemberImageBloc(get<_i3.AddMemberImageRepo>()));
  gh.factory<_i17.EditMemberBloc>(
      () => _i17.EditMemberBloc(get<_i10.EditMemberRepo>()));
  gh.factory<_i18.EditMemberImageBloc>(
      () => _i18.EditMemberImageBloc(get<_i8.EditMemberImageRepo>()));
  gh.factory<_i19.GetDoctersBloc>(
      () => _i19.GetDoctersBloc(get<_i12.GetDoctersRepo>()));
  gh.factory<_i20.UserLocationBloc>(
      () => _i20.UserLocationBloc(get<_i14.UserLocationRepo>()));
  return get;
}
