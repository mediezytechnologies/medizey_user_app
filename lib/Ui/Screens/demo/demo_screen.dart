// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../Repository/Bloc/Favourites/AddFavourites/add_favourites_bloc.dart';
// import '../../../ddd/application/get_docters/get_docters_bloc.dart';
// import '../../../ddd/application/get_fav_doctor/get_fav_doctor_bloc.dart';
// import '../../CommonWidgets/heading_widget.dart';
// import '../../CommonWidgets/vertical_spacing_widget.dart';
// import '../../CommonWidgets/view_all_button_widget.dart';
// import '../HomeScreen/AllDoctorsNearYouScreen/all_doctors_near_you_screen.dart';
// import '../HomeScreen/Widgets/doctor_near_you_widget.dart';
// import '../HomeScreen/Widgets/home_screen_loading_widgets.dart';

// class DemoScreen extends StatefulWidget {
//   const DemoScreen({super.key});

//   @override
//   State<DemoScreen> createState() => _DemoScreenState();
// }

// class _DemoScreenState extends State<DemoScreen> {
//   @override
//   void initState() {
//     BlocProvider.of<GetDoctersBloc>(context)
//         .add(const GetDoctersEvent.started());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return BlocConsumer<GetDoctersBloc, GetDoctersState>(
//       listener: (context, state) {
//         if (state.isError) {
//           Center(
//             child: Image(
//               image:
//                   const AssetImage("assets/images/something went wrong-01.png"),
//               height: 200.h,
//               width: 200.w,
//             ),
//           );
//         }
//       },
//       builder: (context, state) {
//         if (state.isloding) {
//           return doctorNearYouLoadingWidget(context);
//         }
//         return Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const VerticalSpacingWidget(height: 50),
//               const HeadingWidget(
//                 title: "Doctors near you",
//               ),
//               const VerticalSpacingWidget(height: 5),
//               LimitedBox(
//                 maxHeight: size.height * .250,
//                 child: ListView.builder(
//                     shrinkWrap: true,
//                     physics: const BouncingScrollPhysics(),
//                     scrollDirection: Axis.horizontal,
//                     itemCount: state.model.length,
//                     itemBuilder: (context, index) {
//                       // List clinics = state.model[index].clinics!;
//                       // double minDistance = double.infinity;
//                       // for (var clinic in clinics) {
//                       //   if (clinic.distanceFromClinic != null &&
//                       //       clinic.distanceFromClinic! < minDistance) {
//                       //     minDistance = clinic.distanceFromClinic!;
//                       //   }
//                       // }
//                       return DoctorNearYouWidget(
//                           img: state.model[index].favoriteStatus == 1
//                               ? "assets/icons/favorite1.png"
//                               : "assets/icons/favorite2.png",
//                           onTap: () {
//                             setState(() {
//                               BlocProvider.of<GetFavDoctorBloc>(context)
//                                   .add(const GetFavDoctorEvent.started(false));
//                               BlocProvider.of<GetDoctersBloc>(context).add(
//                                   GetDoctersEvent.changeFav(
//                                       state.model[index].id!));
//                               BlocProvider.of<AddFavouritesBloc>(context).add(
//                                 AddFavourites(
//                                   doctorId:
//                                       state.model[index].userId.toString(),
//                                   favouriteStatus: state.favId,
//                                 ),
//                               );
//                             });
//                           },
//                           docterDistance: state
//                               .model[index].clinics!.first.distanceFromClinic
//                               .toString(),
//                           doctorId: state.model[index].userId.toString(),
//                           firstName: state.model[index].firstname.toString(),
//                           lastName: state.model[index].secondname.toString(),
//                           imageUrl: state.model[index].docterImage.toString(),
//                           location: state.model[index].location.toString(),
//                           specialisation:
//                               state.model[index].specialization.toString(),
//                           favouriteStatus: state.model[index].favoriteStatus!);
//                     }),
//               ),
//               const VerticalSpacingWidget(height: 5),
//               ViewAllButtonWidget(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: ((context) => const AllDoctorNearYouScreen()),
//                       ),
//                     );
//                   },
//                   buttonText: "View near you doctors")
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
