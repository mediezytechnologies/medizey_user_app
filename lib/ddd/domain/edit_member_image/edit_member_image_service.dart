import 'package:dartz/dartz.dart';
import 'package:mediezy_user/ddd/domain/add_member_image/model/add_member_image.dart';
import 'package:mediezy_user/ddd/domain/core/failures/main_failure.dart';

abstract class EditMemberImageRepo {
  Future<Either<MainFailure, AddMemberImags?>> getEditmemberImageData(
      String imagePath,
      String patientId
      );
}
