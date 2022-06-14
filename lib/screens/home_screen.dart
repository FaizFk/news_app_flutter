import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/models/data_provider.dart';
import 'package:news_app/widgets/news_card.dart';

bool hasProvided = false;

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<News> newsList = [];
  bool isSpinning = false;
  void getNews() async {
    setState(() {
      isSpinning = true;
    });
    newsList = await DataProvider().newsList;
    setState(() {
      isSpinning = false;
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!hasProvided) {
      hasProvided = true;
      getNews();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return isSpinning
        ? Center(
            child: Text('Loading'),
          )
        : ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, i) {
              return NewsCard(newsList[i]);
            });
  }
}
