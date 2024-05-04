// import 'dart:async';
// import 'dart:developer';
// import 'package:animation_wrappers/animations/faded_slide_animation.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
// import 'package:mediezy_user/Ui/CommonWidgets/recommend_doctor_card.dart';
// import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
// import 'package:mediezy_user/Ui/Consts/app_colors.dart';
// import '../../../../Repository/Bloc/Favourites/AddFavourites/add_favourites_bloc.dart';
// import '../../../../ddd/application/get_docters/get_docters_bloc.dart';
// import '../../../../ddd/application/get_fav_doctor/get_fav_doctor_bloc.dart';
// import '../../../CommonWidgets/doctor_card_widget_2.dart';

// class AllDoctorNearYouScreen2 extends StatefulWidget {
//   const AllDoctorNearYouScreen2({super.key});

//   @override
//   State<AllDoctorNearYouScreen2> createState() =>
//       _AllDoctorNearYouScreen2State();
// }

// class _AllDoctorNearYouScreen2State extends State<AllDoctorNearYouScreen2> {
//   late StreamSubscription<ConnectivityResult> subscription;
//   bool isClicked = false;

//   void handleConnectivityChange(ConnectivityResult result) {
//     if (result == ConnectivityResult.none) {
//     } else {}
//   }
// //cnanges

//   @override
//   void initState() {
//     BlocProvider.of<GetDoctersBloc>(context).add(GetDoctersEvent.started());
//     subscription = Connectivity()
//         .onConnectivityChanged
//         .listen((ConnectivityResult result) {
//       handleConnectivityChange(result);
//     });
//     BlocProvider.of<GetDoctersBloc>(context).add(GetDoctersEvent.started());
//     super.initState();
//   }

//   int? userId;
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               BlocProvider.of<GetDoctersBloc>(context)
//                   .add(GetDoctersEvent.started());
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back_rounded)),
//         title: const Text("Doctors Near You"),
//         centerTitle: true,
//       ),
//       body: StreamBuilder<ConnectivityResult>(
//           stream: Connectivity().onConnectivityChanged,
//           builder: (context, snapshot) {
//             final connectivityResult = snapshot.data;
//             if (connectivityResult == ConnectivityResult.none) {
//               return const InternetHandleScreen();
//             } else {
//               return BlocConsumer<GetDoctersBloc, GetDoctersState>(
//                 listener: (context, state) {
//                   if (state.isloding) {
//                     log("login ${state.isloding}");
//                     Center(
//                       child: CupertinoActivityIndicator(
//                         color: kMainColor,
//                       ),
//                     );
//                   }
//                   if (state.isError) {
//                     Center(
//                       child: Image(
//                         image: const AssetImage(
//                             "assets/images/something went wrong-01.png"),
//                         height: 200.h,
//                         width: 200.w,
//                       ),
//                     );
//                   }
//                   if (state.isloding) {
//                     Center(
//                       child: CupertinoActivityIndicator(
//                         color: kMainColor,
//                       ),
//                     );
//                   }
//                 },
//                 builder: (context, state) {
//                   if (state.isloding) {
//                     Center(
//                       child: CupertinoActivityIndicator(
//                         color: kMainColor,
//                       ),
//                     );
//                   }
//                   BlocProvider.of<AddFavouritesBloc>(context).add(
//                     InitializeFavouriteStatus({}),
//                   );
//                   return FadedSlideAnimation(
//                     beginOffset: const Offset(0, 0.3),
//                     endOffset: const Offset(0, 0),
//                     slideCurve: Curves.linearToEaseOut,
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           ListView.builder(
//                               padding: EdgeInsets.zero,
//                               shrinkWrap: true,
//                               physics: const NeverScrollableScrollPhysics(),
//                               itemBuilder: (context, index) {
//                                 userId = state.model[index].userId;

//                                 //    String ?id =          state.model!.favoriteDoctors![index].userId.toString();
//                                 return DoctorCardWidget2(
//                                   onTap: () {
//                                     BlocProvider.of<GetDoctersBloc>(context)
//                                         .add(GetDoctersEvent.changeFav(state
//                                             .model[index].favoriteStatus!));
//                                     BlocProvider.of<AddFavouritesBloc>(context)
//                                         .add(
//                                       AddFavourites(
//                                         doctorId: state.model[index].userId
//                                             .toString(),
//                                         favouriteStatus: state.favId,
//                                       ),
//                                     );
//                                     BlocProvider.of<GetDoctersBloc>(context)
//                                         .add(GetDoctersEvent.started());
//                                   },
//                                   userAwayFrom: "2.2",
//                                   clinicList:
//                                       state.model[index].clinics!.toList(),
//                                   doctorId:
//                                       state.model[index].userId.toString(),
//                                   firstName:
//                                       state.model[index].firstname.toString(),
//                                   lastName:
//                                       state.model[index].secondname.toString(),
//                                   imageUrl:
//                                       state.model[index].docterImage.toString(),
//                                   mainHospitalName: state
//                                       .model[index].mainHospital
//                                       .toString(),
//                                   specialisation: state
//                                       .model[index].specialization
//                                       .toString(),
//                                   location:
//                                       state.model[index].location.toString(),
//                                   favurates: GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         BlocProvider.of<GetFavDoctorBloc>(context)
//                                   .add(GetFavDoctorEvent.started());
//                                         BlocProvider.of<GetDoctersBloc>(context)
//                                             .add(GetDoctersEvent.changeFav(
//                                                 state.model[index].id!));
//                                         BlocProvider.of<AddFavouritesBloc>(
//                                                 context)
//                                             .add(
//                                           AddFavourites(
//                                             doctorId: state.model[index].userId
//                                                 .toString(),
//                                             favouriteStatus: state.favId,
//                                           ),
//                                         );
//                                       });
//                                     },
//                                     child: Container(
//                                       color: Colors.amber,
//                                       height: size.height * 0.028,
//                                       width: size.width * 0.07,
//                                       child: Image.asset(
//                                         state.model[index].favoriteStatus == 1
//                                             ? "assets/icons/favorite1.png"
//                                             : "assets/icons/favorite2.png",
//                                         color: kMainColor,
//                                         // color: const Color.fromARGB(
//                                         //     255, 197, 120, 120),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                               itemCount: state.model.length),
//                           const VerticalSpacingWidget(height: 5),
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 8.w),
//                             child: const RecommendedDoctorCard(),
//                           ),
//                           const VerticalSpacingWidget(height: 5)
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//           }),
//     );
//   }
// }
