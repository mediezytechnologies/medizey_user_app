import 'package:bloc/bloc.dart';
import 'package:mediezy_user/Model/Article/get_all_article_model.dart';
import 'package:mediezy_user/Repository/Api/Article/article_api.dart';
import 'package:meta/meta.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  late GetAllArticleModel getAllArticleModel;
  ArticleApi articleApi = ArticleApi();
  ArticleBloc() : super(ArticleInitial()) {
    on<FetchArticle>(
      (event, emit) async {
        emit(GetArticleLoading());
        try {
          getAllArticleModel = await articleApi.getArticle();
          emit(GetArticleLoaded());
        } catch (error) {
          print("<<<<< GET ARTICLE ERROR : $error >>>>>");
          emit(GetArticleError());
        }
      },
    );
  }
}
