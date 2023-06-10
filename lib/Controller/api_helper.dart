import 'package:get/get.dart';
import 'package:news_udemy/Model/news_model.dart';

class NewsHelper extends GetConnect implements GetxService {
  Future<List<NewsModel>> getHeadlines() async {
    Response response = await get(
        "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=a9c0b03781794dfe911fa77e728ceb1a");
    List data = response.body["articles"];
    List<NewsModel> newsModel = data.map((e) => NewsModel.fromJson(e)).toList();
    return newsModel;
  }

  Future<List<NewsModel>> getNewsCategory({required String category}) async {
    Response response = await get(
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=a9c0b03781794dfe911fa77e728ceb1a");
    List data = response.body["articles"];
    List<NewsModel> newsModel = data.map((e) => NewsModel.fromJson(e)).toList();
    return newsModel;
  }
}
