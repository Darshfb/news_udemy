class NewsModel {
  String? name,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content;

  NewsModel({
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      name: json['source']["name"],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'] ?? "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg",
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
