// import 'dart:io';
// import 'package:bloc/bloc.dart';
// import 'package:mediezy_user/Repository/Api/HealthRecords/health_record_api.dart';
// import 'package:meta/meta.dart';
// part 'edit_member_event.dart';
// part 'edit_member_state.dart';

// class EditMemberBloc extends Bloc<EditMemberEvent, EditMemberState> {
//   late String updatedSuccessfullyMessage;
//   HealthRecordApi healthRecordApi = HealthRecordApi();
//   EditMemberBloc() : super(EditMemberInitial()) {
//     on<FetchEditMember>((event, emit) async {
//       emit(EditMemberLoading());
//       try {
//         updatedSuccessfullyMessage = await healthRecordApi.updateMember(
//             age: event.age,
//             fullName: event.fullName,
//             gender: event.gender,
//             patientId: event.patientId,
//             allergyDetails: event.allegyDetails,
//             allergyId: event.allergyId,
//             mobileNumber: event.mobileNumber,
//             regularMedicine: event.regularMedicine,
//             surgeryName: event.surgeryName,
//             treatmentTaken: event.treatmentName,
//             surgeryDetails: event.surgeyDetails,
//             treatmentDetails: event.treatmentDetails,
//             event.patientImage);
//         emit(EditMemberLoaded());
//         // Map<String, dynamic> data = jsonDecode(updatedSuccessfullyMessage);
//         // GeneralServices.instance.showToastMessage(data['message']);
//       } catch (e) {
//         print("Error>>>>>>>>>>>>>>>>>>>>>>>>>" + e.toString());
//         emit(EditMemberError());
//       }
//     });
//   }
// }
