import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:hajithon_teami_flutter_app/network/api.dart';
import 'package:hajithon_teami_flutter_app/services/news/model.dart';

class NewsRepository {
  final ApiProvider api;
  NewsRepository({ApiProvider? api}) : api = api ?? Get.find<ApiProvider>();

  Future<News> getNews() async {
    String url = "/news/";

    Response response = await api.dio.get(url);
    return News.fromJson(response.data);
  }
}