import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/HealthCategories/get_health_categories_model.dart';
import 'package:mediezy_user/Repository/Bloc/HealthCategories/GetHealthCategories/get_health_categories_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/Widgets/health_concern_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_screen_loading_widgets.dart';

class HomeHealthConcernWidget extends StatefulWidget {
  const HomeHealthConcernWidget({super.key});

  @override
  State<HomeHealthConcernWidget> createState() =>
      _HomeHealthConcernWidgetState();
}

class _HomeHealthConcernWidgetState extends State<HomeHealthConcernWidget> {
  late GetHealthCategoriesModel getHealthCategoriesModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHealthCategoriesBloc, GetHealthCategoriesState>(
      builder: (context, state) {
        if (state is GetHealthCategoriesLoading) {
          return healthConcernLoadingWidget();
        }
        if (state is GetHealthCategoriesError) {
          return const Center(
            child: Image(
              image: AssetImage("assets/images/something went wrong-01.png"),
            ),
          );
        }
        if (state is GetHealthCategoriesLoaded) {
          getHealthCategoriesModel =
              BlocProvider.of<GetHealthCategoriesBloc>(context)
                  .getHealthCategoriesModel;
          return getHealthCategoriesModel.categories!.isEmpty
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! health concern
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        "Browse by health concern",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: kSubTextColor),
                      ),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        itemCount: getHealthCategoriesModel.categories!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 10,
                                childAspectRatio: .75),
                        itemBuilder: (context, index) {
                          return HealthConcernWidget(
                            title: getHealthCategoriesModel
                                .categories![index].categoryName
                                .toString(),
                            imageUrl: getHealthCategoriesModel
                                .categories![index].image
                                .toString(),
                            healthCategoryId: getHealthCategoriesModel
                                .categories![index].id
                                .toString(),
                          );
                        }),
                  ],
                );
        }
        return Container();
      },
    );
  }
}
