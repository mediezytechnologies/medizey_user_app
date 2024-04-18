import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/Profile/get_user_model.dart';
import 'package:mediezy_user/Repository/Bloc/Profile/GetUser/get_user_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/AddPatientScreen/AddPatientScreen.dart';
import 'package:mediezy_user/Ui/Screens/ProfileScreen/profile_screen.dart';
import 'package:mediezy_user/Ui/Screens/SearchScreen/search_screen.dart';

class HomeIntroCard extends StatefulWidget {
  const HomeIntroCard({super.key});

  @override
  State<HomeIntroCard> createState() => _HomeIntroCardState();
}

class _HomeIntroCardState extends State<HomeIntroCard> {
  late GetUserModel getUserModel;
  @override
  Widget build(BuildContext context) {
    return  Stack(
                    children: [
                      const Image(
                        image: AssetImage("assets/images/home_screen.jpg"),
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        left: 15.w,
                        right: 15.w,
                        child: BlocBuilder<GetUserBloc, GetUserState>(
                          builder: (context, state) {
                            if (state is GetUserDetailsError) {
                              return const Text("No Name");
                            }
                            if (state is GetUserDetailsLoaded) {
                              getUserModel =
                                  BlocProvider.of<GetUserBloc>(context)
                                      .getUserModel;
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfileScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Hi, ${getUserModel.userdetails!.firstname}",
                                  style: TextStyle(
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              );
                            }
                            return Container();
                          },
                        ),
                      ),
                      Positioned(
                        top: 30.h,
                        left: 15.w,
                        child: Text(
                          "Your one stop solution for\nQuick and easy consultation",
                          style: TextStyle(
                              height: 1.2,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      Positioned(
                        top: 70.h,
                        left: 15.w,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return AddPatientScreen();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            height: 40.h,
                            width: MediaQuery.of(context).size.width * .5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kCardColor,
                                width: 1.0,
                              ),
                              color: const Color(0xFF429b79),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Add Family Member",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: kCardColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.h,
                        left: 15.w,
                        right: 15.w,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SearchScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 40,
                            width: 300,
                            decoration: BoxDecoration(
                              color: kCardColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: Text(
                                    "Search your doctor",
                                    style: TextStyle(
                                        fontSize: 15.sp, color: kSubTextColor),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.w),
                                  child: CircleAvatar(
                                    backgroundColor: const Color(0xFF56B89C),
                                    radius: 16,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Icon(
                                        IconlyLight.search,
                                        color: kCardColor,
                                        size: 16.sp,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
  }
}
