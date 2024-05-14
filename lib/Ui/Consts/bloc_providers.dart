import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Article/article_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/BookAppointment/AutoFetch/auto_fetch_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/BookAppointment/BookAppointmets/book_appointment_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/BookAppointment/GetFamilyMembers/get_family_members_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/BookAppointment/OtherTypePatientDetails/other_type_patient_details_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/DoctorRecommend/doctor_recommend_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Favourites/AddFavourites/add_favourites_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetAppointment/GetCompletedAppointments/get_completed_appointments_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetAppointment/GetUpcomingAppointment/get_upcoming_appointment_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetClinic/get_clinic_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetDoctor/GetDoctorById/get_doctor_by_id_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetDoctor/GetDoctors/get_doctor_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetSpecialisations/GetAllSpecialisations/get_all_specialisations_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetSpecialisations/GetDoctorsAsPerSpecialisation/get_doctors_as_per_specialisation_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetSymptoms/get_symptoms_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetToken/get_token_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthCategories/GetDoctorsByHealthCategory/get_doctors_by_health_category_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthCategories/GetHealthCategories/get_health_categories_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/AddMedicine/add_medicine_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/DeleteDocument/delete_document_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/DeleteMedicine/delete_medicine_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/DeleteMember/delete_member_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllMembers/get_all_members_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllPrescriptions/get_all_prescriptions_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllUploadedDocuments/get_all_uploaded_documents_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllergy/get_allergy_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetCompletedAppointmentsByPatientId/get_completed_appointmets_by_patient_id_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetDischageSummaryById/get_discharge_summary_by_id_dart_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetLabReportById/get_lab_report_by_id_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetMemberById/get_member_by_id_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetPrescriptionView/get_prescription_view_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetScanReportById/get_scan_report_by_id_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetUploadedDischargeSummary/get_uploaded_discharge_summary_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetUploadedLabReport/get_uploaded_lab_report_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetUploadedPrescriptionById/get_uploaded_prescription_by_id_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetUploadedScanReport/get_uploaded_scan_report_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetVitals/get_vitals_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/TimeLine/time_line_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/UpdateMedicine/update_medicine_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/UploadDocument/UploadDocument/upload_document_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/UploadDocument/UploadDocumentFinal/upload_document_lab_and_scan_final_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetUpdatedMedicine/get_updated_medicine_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Hospital/GetHospital/get_hospital_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Hospital/GetHospitalById/get_hospital_by_id_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Hospital/GetHospitalDoctorBySpecialisation/get_hospital_doctor_by_specialisation_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/LoginAndSignUp/login_and_signup_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Profile/EditUser/edit_user_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Profile/GetUser/get_user_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Profile/UploadUserImage/upload_user_image_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/QRCodeScan/qr_code_scan_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Questionare/GetCommonSymptom/get_common_symptom_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Questionare/GetQuestions/get_questions_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Suggestion/suggestion_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/banner/banner_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/ContactUs/contact_us_bloc.dart';
import 'package:mediezy_user/ddd/application/add_member_image/add_member_image_bloc.dart';
import 'package:mediezy_user/ddd/application/edit_member/edit_member_bloc.dart';
import 'package:mediezy_user/ddd/application/get_docters/get_docters_bloc.dart';
import 'package:mediezy_user/ddd/application/get_fav_doctor/get_fav_doctor_bloc.dart';
import 'package:mediezy_user/ddd/application/user_location/user_location_bloc.dart';
import 'package:mediezy_user/ddd/application/edit_member_image/edit_member_image_bloc.dart';
import 'package:mediezy_user/ddd/domain/core/di/injectable.dart';
import '../../ddd/application/add_members/add_members_bloc.dart';
import '../../ddd/application/get_recently_booked_doctor/get_recently_booked_doctor_bloc.dart';
import '../../ddd/application/rating/rating_bloc.dart';
// import '../../ddd/application/rating_post/rating_post_bloc.dart';
import '../../ddd/application/search_doctor/search_doctor_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(create: (context) => GetDoctorBloc()),
        BlocProvider(create: (context) => GetDoctorByIdBloc()),
        BlocProvider(create: (context) => LoginAndSignupBloc()),
        BlocProvider(create: (context) => GetTokenBloc()),
        BlocProvider(create: (context) => GetSymptomsBloc()),
        BlocProvider(create: (context) => BookAppointmentBloc()),
        BlocProvider(create: (context) => GetUpcomingAppointmentBloc()),
        BlocProvider(create: (context) => GetCompletedAppointmentsBloc()),
        BlocProvider(create: (context) => GetAllSpecialisationsBloc()),
        BlocProvider(create: (context) => GetDoctorsAsPerSpecialisationBloc()),
        BlocProvider(create: (context) => AddFavouritesBloc()),
        BlocProvider(create: (context) => GetHealthCategoriesBloc()),
        BlocProvider(create: (context) => GetDoctorsByHealthCategoryBloc()),
        BlocProvider(create: (context) => GetUserBloc()),
        BlocProvider(create: (context) => EditUserBloc()),
        BlocProvider(create: (context) => GetAllMembersBloc()),
        BlocProvider(create: (context) => UploadDocumentBloc()),
        BlocProvider(create: (context) => UploadDocumentFinalBloc()),
        BlocProvider(create: (context) => GetMemberByIdBloc()),
        BlocProvider(create: (context) => DeleteMemberBloc()),
        BlocProvider(create: (context) => GetAllUploadedDocumentsBloc()),
        BlocProvider(create: (context) => GetAllPrescriptionsBloc()),
        BlocProvider(create: (context) => GetPrescriptionViewBloc()),
        BlocProvider(create: (context) => TimeLineBloc()),
        BlocProvider(create: (context) => UploadUserImageBloc()),
        BlocProvider(create: (context) => GetUploadedPrescriptionByIdBloc()),
        BlocProvider(create: (context) => GetAllergyBloc()),
        BlocProvider(create: (context) => DeleteDocumentBloc()),
        BlocProvider(create: (context) => GetFamilyMembersBloc()),
        BlocProvider(create: (context) => AutoFetchBloc()),
        BlocProvider(create: (context) => SuggestionBloc()),
        BlocProvider(create: (context) => GetHospitalBloc()),
        BlocProvider(create: (context) => GetHospitalByIdBloc()),
        BlocProvider(create: (context) => ArticleBloc()),
        BlocProvider(
            create: (context) => GetHospitalDoctorBySpecialisationBloc()),
        BlocProvider(
            create: (context) => GetCompletedAppointmetsByPatientIdBloc()),
        BlocProvider(create: (context) => AddMedicineBloc()),
        BlocProvider(create: (context) => DoctorRecommendBloc()),
        BlocProvider(create: (context) => GetClinicBloc()),
        BlocProvider(create: (context) => BannerBloc()),
        BlocProvider(create: (context) => DeleteMedicineBloc()),
        BlocProvider(create: (context) => UpdateMedicineBloc()),
        BlocProvider(create: (context) => GetUploadedLabReportBloc()),
        BlocProvider(create: (context) => GetUploadedScanReportBloc()),
        BlocProvider(create: (context) => GetUploadedDischargeSummaryBloc()),
        BlocProvider(create: (context) => GetLabReportByIdBloc()),
        BlocProvider(create: (context) => GetScanReportByIdBloc()),
        BlocProvider(create: (context) => GetDischargeSummaryByIdDartBloc()),
        BlocProvider(create: (context) => ContactUsBloc()),
        BlocProvider(create: (context) => QrCodeScanBloc()),
        BlocProvider(create: (context) => getIt<AddMembersBloc>()),
        BlocProvider(create: (context) => getIt<AddMemberImageBloc>()),
        BlocProvider(create: (context) => getIt<AddMemberImageBloc>()),
        BlocProvider(create: (context) => GetUpdatedMedicineBloc()),
        BlocProvider(create: (context) => getIt<EditMemberBloc>()),
        BlocProvider(create: (context) => getIt<AddMembersBloc>()),
        BlocProvider(create: (context) => getIt<AddMemberImageBloc>()),
        BlocProvider(create: (context) => getIt<UserLocationBloc>()),
        BlocProvider(create: (context) => getIt<EditMemberImageBloc>()),
        BlocProvider(create: (context) => GetVitalsBloc()),
        BlocProvider(create: (context) => GetCommonSymptomBloc()),
        BlocProvider(create: (context) => GetQuestionsBloc()),
        BlocProvider(create: (context) => getIt<GetDoctersBloc>()),
        BlocProvider(create: (context) => OtherTypePatientDetailsBloc()),
        BlocProvider(create: (context) => getIt<GetFavDoctorBloc>()),
        BlocProvider(create: (context) => getIt<GetRecentlyBookedDoctorBloc>()),
        BlocProvider(create: (context) => getIt<SearchDoctorBloc>()),
        BlocProvider(create: (context) => getIt<RatingBloc>()),
        // BlocProvider(create: (context) => getIt<RatingPostBloc>()),
      ];
}
