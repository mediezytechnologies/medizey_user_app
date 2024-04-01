// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart';
import 'package:mediezy_user/Model/Article/get_all_article_model.dart';
import 'package:mediezy_user/Repository/Api/ApiClient.dart';

class ArticleApi {
  ApiClient apiClient = ApiClient();

  //* get all articles
  Future<GetAllArticleModel> getArticle() async {
    String basePath = "patient/getAllArticles";
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    print("<<<<< GET ALL DOCTORS WORKED SUCCESSFULLY >>>>>");
    return GetAllArticleModel.fromJson(json.decode(response.body));
  }
}
