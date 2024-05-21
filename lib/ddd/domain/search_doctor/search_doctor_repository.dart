import 'package:dartz/dartz.dart';
import 'package:mediezy_user/ddd/domain/search_doctor/model/search_doctor.dart';

import '../error_model/error_model.dart';

abstract class SearchDoctorRepository {
  Future<Either<ErrorModel, List<SearchDoctor>>> searchDoctor(
      {required String searchQuery});
}
