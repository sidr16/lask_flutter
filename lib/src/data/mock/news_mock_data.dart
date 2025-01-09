import '../../domain/models/category_model/category_model.dart';
import '../../domain/models/news_model/news_model.dart';

class NewsMockData {
  static List<NewsModel> getNews() {
    return List.generate(
      20,
      (index) => NewsModel(
        title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        imageUrl: 'https://picsum.photos/200/302',
        publishedAt: DateTime.now(),
        category: CategoryModel(name: 'Technology'),
      ),
    );
  }
}
