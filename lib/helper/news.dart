import 'dart:convert';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/views/article_view.dart';
import 'package:http/http.dart' as http;

class News {

  List<ArticleModel> news = [];

  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=27595ce402a7464f9a64616615032d0e";

    try{
      var response = await http.get(url as Uri);
      if (response.statusCode == 200) {
       var jsonData = jsonDecode(response.body);

      if (jsonData['status'] == "ok"){
        jsonData["articles"].forEach((element){
          if (element["urlToImage"] != null && element['description'] != null){

  ArticleModel articleModel = ArticleModel(
    title: element['title'],
    author: element["author"],
    description: element["description"],
    url: element["url"],
    urlToImage: element["urlToImage"],
    content: element["content"]
  );

  news.add(articleModel);
 }

  });
}
} else {
  print("Failed to load news: ${response.statusCode}");
}
} catch(e){
  print("Error occurred: $e");
}
}
}

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  News newsClass = News();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    await newsClass.getNews();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator())
        )
          : ListView.builder(
              itemCount: newsClass.news.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(newsClass.news[index].title),
                  subtitle: Text(newsClass.news[index].description),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleView(
                          blogUrl: newsClass.news[index].url,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}