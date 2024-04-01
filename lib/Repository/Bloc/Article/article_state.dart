part of 'article_bloc.dart';

@immutable
sealed class ArticleState {}

final class ArticleInitial extends ArticleState {}


class GetArticleLoading extends ArticleState{}
class GetArticleLoaded extends ArticleState{}
class GetArticleError extends ArticleState{}

