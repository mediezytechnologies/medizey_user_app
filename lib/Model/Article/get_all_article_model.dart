class GetAllArticleModel {
  bool? status;
  String? message;
  List<Articles>? articles;

  GetAllArticleModel({this.status, this.message, this.articles});

  GetAllArticleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  int? articleId;
  String? bannerImage;
  String? articleTitle;
  String? articleDescription;
  String? authorName;
  String? authorImage;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  String? categoryName;
  String? mainBanner;

  Articles(
      {this.articleId,
      this.bannerImage,
      this.articleTitle,
      this.articleDescription,
      this.authorName,
      this.authorImage,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.categoryName,
      this.mainBanner});

  Articles.fromJson(Map<String, dynamic> json) {
    articleId = json['article_id'];
    bannerImage = json['banner_image'];
    articleTitle = json['article_title'];
    articleDescription = json['article_description'];
    authorName = json['author_name'];
    authorImage = json['author_image'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryName = json['category_name'];
    mainBanner = json['main_banner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['article_id'] = articleId;
    data['banner_image'] = bannerImage;
    data['article_title'] = articleTitle;
    data['article_description'] = articleDescription;
    data['author_name'] = authorName;
    data['author_image'] = authorImage;
    data['category_id'] = categoryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['category_name'] = categoryName;
    data['main_banner'] = mainBanner;
    return data;
  }
}
