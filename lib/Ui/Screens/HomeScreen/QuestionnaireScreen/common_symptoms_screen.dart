import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Repository/Bloc/Questionare/GetCommonSymptom/get_common_symptom_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/QuestionnaireScreen/symptoms_view_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonSymptomsScreen extends StatefulWidget {
  const CommonSymptomsScreen({super.key});

  @override
  State<CommonSymptomsScreen> createState() => _CommonSymptomsScreenState();
}

class _CommonSymptomsScreenState extends State<CommonSymptomsScreen> {
  String? userName;

  Future<void> getUserName() async {
    final preference = await SharedPreferences.getInstance();
    setState(() {
      userName = preference.getString('firstName').toString();
    });
  }

  @override
  void initState() {
    BlocProvider.of<GetCommonSymptomBloc>(context).add(FetchCommonSymptoms());
    getUserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kCardColor,
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi $userName, let's get started.",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "Please Pick a symptom that is troubling you the most",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: kSubTextColor),
                    ),
                  ],
                ),
              ),
            ),
            const VerticalSpacingWidget(height: 5),
            Text(
              "Common Symptoms",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
            ),
            const VerticalSpacingWidget(height: 10),
            BlocBuilder<GetCommonSymptomBloc, GetCommonSymptomState>(
              builder: (context, state) {
                if (state is GetCommonSymptomLoading) {
                  return SizedBox(
                    height: 350.h,
                    child: Center(
                      child: CircularProgressIndicator(color: kMainColor),
                    ),
                  );
                }
                if (state is GetCommonSymptomError) {
                  return Center(
                    child: Text(
                      state.errorMessage.toString(),
                    ),
                  );
                }
                if (state is GetCommonSymptomLoaded) {
                  return GridView.builder(
                      itemCount: state.commonSymptomModel.data!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              childAspectRatio: .95),
                      itemBuilder: (context, index) {
                        final symptom = state.commonSymptomModel.data![index];
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SymptomsViewScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        symptom.symptomImage.toString(),
                                      ),
                                      fit: BoxFit.fill),
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
