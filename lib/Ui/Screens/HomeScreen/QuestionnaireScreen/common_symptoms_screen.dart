import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/QuestionnaireScreen/question_view_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../ddd/application/questionare/get_questionare_symptom/get_questionare_symptom_bloc_bloc.dart';
import '../../../Consts/text_style.dart';

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
    BlocProvider.of<GetQuestionareSymptomBlocBloc>(context)
        .add(const GetQuestionareSymptomBlocEvent.started());
    getUserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                    Text("Hi $userName, let's get started.",
                        style: black14B600),
                    const VerticalSpacingWidget(height: 5),
                    Text("Please Pick a symptom that is troubling you the most",
                        style: grey13B500),
                  ],
                ),
              ),
            ),
            const VerticalSpacingWidget(height: 5),
            Text(
              "Common Symptoms",
              style: black15B500,
            ),
            const VerticalSpacingWidget(height: 10),
            BlocBuilder<GetQuestionareSymptomBlocBloc,
                GetQuestionareSymptomBlocState>(builder: (context, state) {
              if (state.isloding) {
                return SizedBox(
                  height: size.height * .7,
                  child: Center(
                    child: CircularProgressIndicator(color: kMainColor),
                  ),
                );
              }
              if (state.isError) {
                return Center(
                  child: Text(
                    state.message.toString(),
                  ),
                );
              }
              return GridView.builder(
                  itemCount: state.model.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: size.width * .01,
                      mainAxisSpacing: size.width * .01,
                      childAspectRatio: .95),
                  itemBuilder: (context, index) {
                    final symptom = state.model[index];
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuestionViewScreen(
                                  symptomId:
                                      state.model[index].symptomId.toString(),
                                  symptomName:
                                      state.model[index].symptomName.toString(),
                                ),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.network(
                              symptom.symptomImage.toString(),
                              height: size.height * .15,
                              width: size.width * .28,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Image.asset(
                                  "assets/icons/no image.png",
                                  height: size.height * .15,
                                  width: size.width * .28,
                                  color: kMainColor,
                                ),
                              ),
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Center(
                                  child: Shimmer.fromColors(
                                    baseColor: kShimmerBaseColor,
                                    highlightColor: kShimmerHighlightColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(80.r),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            }),
          ],
        ),
      ),
    );
  }
}
