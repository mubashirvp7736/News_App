import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:newsapp/model/news_channel_headlines.dart';

class NewsRepository{

  Future<NewsHeadLines>fetchNewsHeadlineApi()async{

    String url="https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=9dd5deaa8e5043dcbaa50caa67a434b4";

    final response=await http.get(Uri.parse(url));
    
    if(response.statusCode==200){
      final body=jsonDecode(response.body);
      return NewsHeadLines.fromJson(body);
    }
    throw Exception('error');
  }

}

