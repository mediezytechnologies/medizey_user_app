import 'package:dartz/dartz.dart';
import 'package:mediezy_user/ddd/domain/add_member/model/add_member_model.dart';
import 'package:mediezy_user/ddd/domain/add_member/model/medicines.dart';
import 'package:mediezy_user/ddd/domain/core/failures/main_failure.dart';

abstract class AddMemberRepo {
  Future<Either<MainFailure, AddMemberModel>> getdoctersData({
    required String fullName,
    required String age,
    required String mobileNumber,
    required String gender,
    required String regularMedicine,
    required String surgeryName,
    required String treatmentTaken,
    required String surgeryDetails,
    required String treatmentTakenDetails,
    required List<Map<String, dynamic>> allergies,
    List<Medicines>? medicines,
  });
}
