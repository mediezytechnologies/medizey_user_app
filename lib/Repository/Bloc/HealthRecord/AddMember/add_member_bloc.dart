// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:bloc/bloc.dart';
// import 'package:mediezy_user/Repository/Api/HealthRecords/health_record_api.dart';
// import 'package:meta/meta.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// part 'add_member_event.dart';
// part 'add_member_state.dart';

<<<<<<< HEAD
class AddMemberBloc extends Bloc<AddMemberEvent, AddMemberState> {
  HealthRecordApi healthRecordApi = HealthRecordApi();
  AddMemberBloc() : super(AddMemberInitial()) {
    on<FetchAddMember>((event, emit) async {
      final preference = await SharedPreferences.getInstance();
      try {
        emit(AddMemberLoadingState());
        final response = await healthRecordApi.addFamilyMember(
          age: event.age,
          fullName: event.fullName,
          gender: event.gender,
          mobileNumber: event.mobileNumber,
          regularMedicine: event.regularMedicine,
          surgeryName: event.surgeyName,
          treatmentTaken: event.treatmentTaken,
          medicines: event.medicines,
          allergies: event.allergies,
          surgeryDetails: event.suregeryDetails,
          treatmentTakenDetails: event.treatmentTakenDetails,
        );
        final responseData = json.decode(response);
        final status = responseData['status'];
        final message = responseData['response'];
        preference.setInt('patientId', responseData['patient_id']);
        log("Call patient id ${preference.getInt('patientId').toString()}");
        if (status != null && message != null) {
          if (status == true) {
            emit(AddMemberLoadedState(successMessage: message));
          } else {
            emit(AddMemberErrorState(errorMessage: message));
          }
        }
      } catch (e) {
        final errorMessage = _extractErrorMessage(e.toString());
        emit(AddMemberErrorState(errorMessage: errorMessage));
      }
    });
=======
// class AddMemberBloc extends Bloc<AddMemberEvent, AddMemberState> {
//   HealthRecordApi healthRecordApi = HealthRecordApi();
//   AddMemberBloc() : super(AddMemberInitial()) {
//     on<FetchAddMember>((event, emit) async {
//       final preference = await SharedPreferences.getInstance();
//       try {
//         emit(AddMemberLoadingState());
//         final response = await healthRecordApi.addFamilyMember(
//           age: event.age,
//           fullName: event.fullName,
//           gender: event.gender,
//           mobileNumber: event.mobileNumber,
//           regularMedicine: event.regularMedicine,
//           surgeryName: event.surgeyName,
//           treatmentTaken: event.treatmentTaken,
//           medicines: event.medicines,
//           allergies: event.allergies,
//           surgeryDetails: event.suregeryDetails,
//           treatmentTakenDetails: event.treatmentTakenDetails,
//         );
//         final responseData = json.decode(response);
//         final status = responseData['status'];
//         final message = responseData['response'];
//         preference.setInt('patientId', responseData['patient_id']);
//         log("Call patient id ${preference.getInt('patientId').toString()}");
//         if (status != null && message != null) {
//           if (status == true) {
//             emit(AddMemberLoadedState(successMessage: message));
//           } else {
//             emit(AddMemberErrorState(errorMessage: message));
//           }
//         } else {
//           emit(AddMemberErrorState(errorMessage: "Unexpected response format"));
//         }
//       } catch (e) {
//         final errorMessage = _extractErrorMessage(e.toString());
//         emit(AddMemberErrorState(errorMessage: errorMessage));
//       }
//     });
>>>>>>> fe0e675d98c5501f7e9ae26aef4a7c9763a660c3

//     on<AddFamilyMemberImageEvent>((event, emit) async {
//       try {
//         emit(AddMemberLoadingState());
//         final response = await healthRecordApi.addFamilyMemberImage(
//             patientImage: event.image);
//         final responseData = json.decode(response);
//         final status = responseData['status'];
//         final message = responseData['message'];
//         if (status != null && message != null) {
//           if (status == true) {
//             emit(AddMemberLoadedState(successMessage: message));
//           } else {
//             emit(AddMemberErrorState(errorMessage: message));
//           }
//         } else {
//           emit(AddMemberErrorState(errorMessage: "Unexpected response format"));
//         }
//       } catch (e) {
//         final errorMessage = _extractErrorMessage(e.toString());

//         emit(AddMemberErrorState(errorMessage: errorMessage));
//       }
//     });
//   }

//   String _extractErrorMessage(String errorMessage) {
//     try {
//       final jsonData = json.decode(errorMessage);
//       return jsonData['response'];
//     } catch (e) {
//       return e.toString();
//     }
//   }
// }
