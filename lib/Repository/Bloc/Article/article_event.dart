part of 'article_bloc.dart';

@immutable
sealed class ArticleEvent {}

class FetchArticle extends ArticleEvent{}
