class ArticleModel {
  String? author;
  String? title;
  String? description;
  String?urlToImage;
  String? publishedAt;

  ArticleModel({
    this.title,
    this.urlToImage,
    this.author,
    this.description,
    this.publishedAt
});

  factory ArticleModel.fromJson(Map<String,dynamic> json){
    return ArticleModel(
      title: json['title'],
      urlToImage: json['urlToImage'],
      author: json['author'],
      description: json['description'],
      publishedAt: json['publishedAt'],


    );
  }
}