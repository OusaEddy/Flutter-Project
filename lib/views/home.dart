// ignore_for_file: prefer_const_constructors, duplicate_ignore, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';
import 'package:flutter_news/helper/data.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/models/category_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_news/views/article_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];

  News newsClass = News();
  bool _loading = true;

  @override
  void initState(){
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async{
   News newsClass = News();
   await newsClass.getNews();
   articles = newsClass.news;
   print("Articles fetched: ${articles.length}");
   setState(() {
     _loading = false;
   });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text("Buzz"),
          Text("Brief", style: TextStyle(color: Colors.blue),)
        ],
      ),
      elevation: 0.0,
      ),
      body: _loading ? Center(
        child: Container(
        child: CircularProgressIndicator(),
        ),
      ):
       SingleChildScrollView(
         child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
           child: Column(
             children: <Widget>[
         
            /// Categories
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index){
                  return CategoryTile(
                    imageUrl: categories[index].imageUrl,
                    categoryName: categories[index].categoryName,
                  );
                }),
            ),
         
            /// Blogs
            Container(
              padding: EdgeInsets.only(top: 16),
              child: ListView.builder(
                itemCount: articles.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index){
                  return BlogTile(
                    imageUrl: articles[index].urlToImage, 
                    title: articles[index].title, 
                    desc: articles[index].description,
                    url: articles[index].url,
                    );
                }),
            )
          ],
               ),
             ),
       ));
  }
}
class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;

 
  CategoryTile({required this.imageUrl,required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: imageUrl, width: 120,height: 60, fit:BoxFit.cover,)),
            Container(
              alignment: Alignment.center,
              width: 120,height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(categoryName, style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}


class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc,url;

  BlogTile(
    {required this.imageUrl,
    required this.title,
    required this.desc,
    required this.url});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl)),
            SizedBox(height: 8),
            Text (title, style: TextStyle(
              fontSize: 17,
              color: Colors.black87,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 8),
            Text(desc, style: TextStyle(color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}