import 'package:dartz/dartz.dart';
import 'package:mediezy_user/ddd/domain/error_model/error_model.dart';
import 'package:mediezy_user/ddd/domain/get_recently_booked_doctors/model/recently_booked_doctor.dart';

abstract class GetRecentlyBookedDoctorRepository {
  Future<Either<ErrorModel,List<RecentlyBookedDoctor>>> getRecentlyBookedDoctorsRepo();
}