import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget{
  NewsItem ({super.key,
    required this.newsImage,
    required this.newsTitle,
    required this.newsDesc,
    required this.newsDate,});

  final String newsImage;
  final String newsTitle;
  final String newsDesc;
  final String newsDate;


  @override
  Widget build(BuildContext context) {
    return

      Row(
        spacing: 12,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Expanded(
              child: Container(
                width: 148,
                height: 91,
                child: Image.network(newsImage,
                errorBuilder: (context, error, stackTrace)
                {
                  return const Icon(Icons.error, color: Colors.red, size: 50);
                }
                ),),
            ),


            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(newsTitle,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),),

                  SizedBox(height: 10,),

                  Text(
                    newsDesc,
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12
                    ),

                  )

                  ,

                  SizedBox(height: 10,),

                  Padding(
                    padding: const EdgeInsets.only(left: 130),
                    child: Text(newsDate,

                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: Color(0xffD2B0B0)
                      ),),
                  ),
                ],),
            )
          ]




      );


  }
}

