// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';

import 'package:mediezy_user/Ui/Consts/app_colors.dart';

import '../../../../ddd/application/rating_item/rating_item_bloc.dart';
import '../../../../ddd/application/rating_ui/rating_ui_bloc.dart';
import '../../../CommonWidgets/common_button_widget.dart';
import '../../../CommonWidgets/text_style_widget.dart';
import '../../../CommonWidgets/vertical_spacing_widget.dart';

class UserRating extends StatefulWidget {
  const UserRating({super.key});

  @override
  State<UserRating> createState() => _UserRatingState();
}

class _UserRatingState extends State<UserRating> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        child: Container(
          height: size.height * 0.2,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.r,
              ),
              border: Border.all(
                color: kBorderColor,
              ),
              color: kCardColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.stars,
                size: 50.sp,
                color: kstarColor,
              ),
              BlocBuilder<RatingUiBloc, RatingUiState>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                          initialRating: state.ratingValue,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                          onRatingUpdate: (rating) {
                            log("rating ui bulidre :  ${state.ratingValue}");
                            if (rating == 0.5 || rating == 1) {
                              BlocProvider.of<RatingUiBloc>(context).add(
                                  const RatingUiEvent.ratingTextChanged(
                                      "TERRIBLE"));
                              log("rating ui ${state.ratingTest}");
                            } else if (rating == 1.5 || rating == 2) {
                              BlocProvider.of<RatingUiBloc>(context)
                                  .add(const RatingUiEvent.ratingTextChanged("OK"));
                              log("rating ui ${state.ratingTest}");
                            } else if (rating == 2.5 || rating == 3) {
                              BlocProvider.of<RatingUiBloc>(context).add(
                                  const RatingUiEvent.ratingTextChanged("BETTER"));
                              log("rating ui ${state.ratingTest}");
                            } else if (rating == 3.5 || rating == 4) {
                              BlocProvider.of<RatingUiBloc>(context).add(
                                  const RatingUiEvent.ratingTextChanged("BEST"));
                              log("rating ui ${state.ratingTest}");
                            } else if (rating == 4.5 || rating == 5) {
                              BlocProvider.of<RatingUiBloc>(context).add(
                                  const RatingUiEvent.ratingTextChanged(
                                      "EXCELLENT"));
                              log("rating ui ${state.ratingTest}");
                            }
                            BlocProvider.of<RatingUiBloc>(context)
                                .add(RatingUiEvent.ratingChanged(rating));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RatingFormScreen(
                                    initalValue: state.ratingValue,
                                    ratingText: state.ratingTest,
                                  ),
                                ));
                          }),
                      Text(
                        "How was your appointment experience \nwith Dr Arun kumar?",
                        style: black14B600,
                      ),
                      Text("rating : ${state.ratingTest}"),
                      Text("rating : ${state.ratingValue}"),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RatingFormScreen extends StatefulWidget {
  RatingFormScreen({
    Key? key,
    required this.initalValue,
    required this.ratingText,
  }) : super(key: key);
  final double initalValue;
  String ratingText;

  @override
  State<RatingFormScreen> createState() => _RatingFormScreenState();
}

class _RatingFormScreenState extends State<RatingFormScreen> {
  String? rText = '';
  @override
  void initState() {
    // BlocProvider.of<RatingUiBloc>(context)
    //     .add(RatingUiEvent.ratingChanged(widget.initalValue));
    rText = widget.ratingText;
    super.initState();
  }

  double? value;

  int? selactedIndex;
  int? likeIndex;
  int? radioIndex;
  changeIndex(changedIndex) {
    setState(() {
      selactedIndex = changedIndex;
    });
  }

  changeLikeIndex(changedLikeIndex) {
    setState(() {
      likeIndex = changedLikeIndex;
    });
  }

  changeRadiondex(changedRadioIndex) {
    setState(() {
      radioIndex = changedRadioIndex;
    });
  }

  List radioItem = [
    "Less than 20 min",
    "20 nin to 40 min",
    "40 min to 1 hr",
    "more then 1 hr",
  ];
  List likeItem = [
    {'name': 'Yes  ', 'Icon': Icons.thumb_up_alt_outlined},
    {'name': 'No  ', 'Icon': Icons.thumb_down_off_alt_rounded},
  ];

  List textReson = [
    "Doctor Not Friendly",
    "Explanation of Issue",
    "High Wait Time",
    "Unhelpfull Staff",
    "Charged Higher Fee",
    "Incorect Location",
    "Doctor Unavailable",
    "Other"
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        //leading: IconButton(onPressed: () {

        //       BlocProvider.of<RatingUiBloc>(context)
        // .add(RatingUiEvent.ratingChanged(value!));
        // log("val : $value");
        // Navigator.pop(context);
        //    }, icon: Icon(Icons.arrow_back)),
        title: const Text("Dr Arun kumar"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<RatingUiBloc, RatingUiState>(
          builder: (context, state) {
            return Column(
              children: [
                starRating(state, context),
                const VerticalSpacingWidget(height: 5),
                Text(
                  state.ratingTest,
                  style: black14B600,
                ),
                const VerticalSpacingWidget(height: 5),
                const Divider(
                  thickness: 2,
                ),
                const VerticalSpacingWidget(height: 5),
                reson(size,state, context),
                const VerticalSpacingWidget(height: 10),
                const Divider(
                  thickness: 2,
                ),
                likeUnlike(size),
                const VerticalSpacingWidget(height: 10),
                const Divider(
                  thickness: 2,
                ),
                const VerticalSpacingWidget(height: 10),
                radioButtonWidget(size),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child:
                      CommonButtonWidget(title: "Submit", onTapFunction: () {}),
                ),
                const VerticalSpacingWidget(height: 15)
              ],
            );
          },
        ),
      ),
    );
  }

  RatingBar starRating(RatingUiState state, BuildContext context) {
    return RatingBar.builder(
                  itemSize: 27.r,
                  initialRating: state.ratingValue,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                  onRatingUpdate: (rating) {
                    value = rating;
                    log(rating.toString());
                    log("rating ui bulidre :  ${state.ratingValue}");

                    if (rating == 0.5 || rating == 1) {
                      BlocProvider.of<RatingUiBloc>(context)
                          .add(const RatingUiEvent.ratingTextChanged("TERRIBLE"));
                      log("rating ui ${state.ratingTest}");
                    } else if (rating == 1.5 || rating == 2) {
                      BlocProvider.of<RatingUiBloc>(context)
                          .add(const RatingUiEvent.ratingTextChanged("OK"));
                      log("rating ui ${state.ratingTest}");
                    } else if (rating == 2.5 || rating == 3) {
                      BlocProvider.of<RatingUiBloc>(context)
                          .add(const RatingUiEvent.ratingTextChanged("BETTER"));
                      log("rating ui ${state.ratingTest}");
                    } else if (rating == 3.5 || rating == 4) {
                      BlocProvider.of<RatingUiBloc>(context)
                          .add(const RatingUiEvent.ratingTextChanged("BEST"));
                      log("rating ui ${state.ratingTest}");
                    } else if (rating == 4.5 || rating == 5) {
                      BlocProvider.of<RatingUiBloc>(context).add(
                          const RatingUiEvent.ratingTextChanged("EXCELLENT"));
                      log("rating ui ${state.ratingTest}");
                    }
                    BlocProvider.of<RatingUiBloc>(context)
                        .add(RatingUiEvent.ratingChanged(rating));
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => RatingFormScreen(
                    //         initalValue: state.ratingValue,
                    //         ratingText: state.ratingTest,
                    //       ),
                    //     ));
                  });
  }

//radio=================================

  Padding radioButtonWidget(Size size,) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "How long did you wait to be seen by the doctor?",
            style: black14B600,
          ),
          const VerticalSpacingWidget(height: 10),
          SizedBox(
            height: size.height * 0.21,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          changeRadiondex(index);
                        },
                        child: Container(
                          height: 20,
                          width: 40,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  radioIndex == index ? kMainColor : kCardColor,
                              border: Border.all(color: kMainColor)),
                        ),
                      ),
                      const HorizontalSpacingWidget(width: 5),
                      Text(
                        radioItem[index],
                        style: radioIndex == index ? wmain4B500 : black14B500,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) =>
                    const VerticalSpacingWidget(height: 15),
                itemCount: radioItem.length),
          )
        ],
      ),
    );
  }

  //like button=================================

  Padding likeUnlike(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Would you like to recommended the doctor",
            style: black14B600,
          ),
          const VerticalSpacingWidget(height: 10),
          Row(
            children: List.generate(
              2,
              (index) => GestureDetector(
                onTap: () {
                  changeLikeIndex(index);
                },
                child: Padding(
                  padding: EdgeInsets.only(right: size.width * 0.03),
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: kCardColor,
                        border: Border.all(color: kBorderColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          likeItem[index]['Icon'],
                          color:
                              likeIndex == index ? kMainColor : kSubTextColor,
                        ),
                        Text(
                          likeItem[index]['name'],
                          style: likeIndex == index ? wmain4B500 : black14B500,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

//reson=================================
  Column reson(Size size,RatingUiState state, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sorry to hear to Tell us what when wrong",
          style: black14B600,
        ),
        const VerticalSpacingWidget(height: 5),
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: size.height * 0.02,
          spacing: size.width * 0.02,
          children: List.generate(
            8,
            (index) => GestureDetector(
              onTap: () {
                 BlocProvider.of<RatingUiBloc>(context)
                          .add( RatingUiEvent.ratingResonChanged(index));
               // changeIndex(index);
              },
              child: Container(
                height: size.height * 0.06,
                width: size.width * 0.47,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: state.resonIndex == index ? kMainColor : kCardColor,
                    border: Border.all(color: kBorderColor)),
                child: Center(
                    child: Text(
                  textReson[index],
                  style: state.resonIndex == index ? white14B500 : black14B500,
                )),
              ),
            ),
          ),
        ),
      ],
    );
  }

//rating=================================
  RatingBar ratingBar() {
    return RatingBar.builder(
      itemSize: 27.r,
      initialRating: widget.initalValue,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        log(rating.toString());
        setState(() {
          if (rating == 0.5 || rating == 1) {
            rText = "TERRIBLE";
          } else if (rating == 1.5 || rating == 2) {
            rText = "OK";
          } else if (rating == 2.5 || rating == 3) {
            rText = "BETTER";
          } else if (rating == 3.5 || rating == 4) {
            rText = "BEST";
          } else if (rating == 4.5 || rating == 5) {
            rText = "EXCELlENT";
          }
        });
        log(rText!);
      },
    );
  }
}
