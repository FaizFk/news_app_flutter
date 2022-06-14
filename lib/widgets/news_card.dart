import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/news.dart';

class NewsCard extends StatelessWidget {
  News news;

  NewsCard(@required this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 8, color: Colors.black)),
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          news.image_url == ''
              ? CircleAvatar(
                  radius: 60,
                  child: Center(child: Text('No Image')),
                )
              : Container(
                  height: 200,
                  width: double.infinity,
                  child: Image.network(
                    news.image_url,
                    fit: BoxFit.cover,
                  ),
                ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  '${news.title}',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                      color: Colors.orange),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${news.description}',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
