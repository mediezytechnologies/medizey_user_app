import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/infrastructure/core/api_end_pont.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/add_member_image/add_image_impl.dart';
import '../../domain/add_member_image/model/add_member_image.dart';
import '../../domain/core/failures/main_failure.dart';
import 'package:http_parser/http_parser.dart';

@LazySingleton(as: AddMemberImageRepo)
class RegisterServiceImpl implements AddMemberImageRepo {
  @override
  Future<Either<MainFailure, AddMemberImags?>> getmemberImaageData(
      String imagePath) async {
    final preference = await SharedPreferences.getInstance();
    String? token =
        preference.getString('token') ?? preference.getString('tokenD');
    int? patianrId;
    patianrId = preference.getInt('patientId');
    try {
      log("message  : $patianrId ");
      MultipartFile addMemberImage = await MultipartFile.fromFile(imagePath,
          filename: imagePath, contentType: MediaType('image', 'jpg'));
      FormData formData = FormData.fromMap({
        'patient_id': patianrId,
        'user_image': addMemberImage,
      });
      final response = await Dio(BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        contentType: 'application/json',
      )).post(
        ApiEndPoints.addMemberImage,
        data: formData,
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = AddMemberImags.fromJson(response.data);

        log("result : $result");

        return Right(result);
      } else {
        log("${const MainFailure.clientFailure()}");
        return const Left(MainFailure.clientFailure());
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log(e.message!);
      log(e.error.toString());

      log(e.error.toString());
      log("${const MainFailure.serverFailure()}");
      return const Left(MainFailure.serverFailure());
    }
  }
}
