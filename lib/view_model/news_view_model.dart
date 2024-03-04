import 'package:newsapp/model/news_channel_headlines.dart';
import 'package:newsapp/repository/news_repository.dart';

class NewViewModel{

final _rep=NewsRepository();

Future<NewsHeadLines>fetchNewsHeadlineApi()async{
  final response=await _rep.fetchNewsHeadlineApi();
  return response;
}
}