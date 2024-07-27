import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/services/news/model.dart';
import 'package:hajithon_teami_flutter_app/services/news/repository.dart';

class NewsService extends GetxController {
  final NewsRepository repository;

  final Rx<News?> _news = Rx(null);
  News? get news => _news.value;
  NewsService({NewsRepository? repository}) : repository = repository ?? NewsRepository();

  Future<void> fetchNews() async {
    _news.value = await repository.getNews();
  }
}
