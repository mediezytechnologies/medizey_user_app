import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/Article/get_all_article_model.dart';
import 'package:mediezy_user/Repository/Bloc/Article/article_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/ArticleScreen/article_screen.dart';

class HomeArticleWidget extends StatefulWidget {
  const HomeArticleWidget({super.key});

  @override
  State<HomeArticleWidget> createState() => _HomeArticleWidgetState();
}

class _HomeArticleWidgetState extends State<HomeArticleWidget> {
  late GetAllArticleModel getAllArticleModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is GetArticleLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: kMainColor,
            ),
          );
        }
        if (state is GetArticleError) {
          return Center(
            child: Image(
              image:
                  const AssetImage("assets/images/something went wrong-01.png"),
              height: 200.h,
              width: 200.w,
            ),
          );
        }
        if (state is GetArticleLoaded) {
          getAllArticleModel =
              BlocProvider.of<ArticleBloc>(context).getAllArticleModel;
          return getAllArticleModel.articles == null
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        "Featured",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: kSubTextColor),
                      ),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: getAllArticleModel.articles!.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 4.w, right: 4.w),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ArticleScreen(
                                      articleDescription: getAllArticleModel
                                          .articles![index].articleDescription
                                          .toString(),
                                      articleImage: getAllArticleModel
                                          .articles![index].mainBanner
                                          .toString(),
                                      articleTitle: getAllArticleModel
                                          .articles![index].articleTitle
                                          .toString(),
                                      authorImage: getAllArticleModel
                                          .articles![index].authorImage
                                          .toString(),
                                      authorName: getAllArticleModel
                                          .articles![index].authorName
                                          .toString(),
                                      categoryId: getAllArticleModel
                                          .articles![index].categoryId
                                          .toString(),
                                      categoryName: getAllArticleModel
                                          .articles![index].categoryName
                                          .toString(),
                                    ),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  getAllArticleModel
                                      .articles![index].bannerImage
                                      .toString(),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const VerticalSpacingWidget(height: 10),
                  ],
                );
        }
        return Container();
      },
    );
  }
}
