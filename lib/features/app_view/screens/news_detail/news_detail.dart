import 'package:flutter/material.dart';
import 'package:flutter_insight_project/model/article_model.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail({super.key , required this.model});
  final ArticleModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      appBar: AppBar(
        actionsPadding: EdgeInsetsGeometry.all(10),
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(context);

            },
            child: Icon(Icons.arrow_back_ios_new)),
        title:Text(
          'News Detail',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),

        centerTitle: true,
        actions: [ Icon(Icons.bookmark_border)]
      ),

      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
                child: Image.network(model.urlToImage??'',
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: Icon(Icons.image, size: 200),
                    );
                  },)
              ),

              SizedBox(height: 8,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(model.author??'',
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                      ),),

                    Spacer(),

                    fav_icon_check(),

                    Text('204',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                      ),),

                  ],
                ),
              ),

              SizedBox(height: 8,),

              Text(model.title??"",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12
              ),),

              SizedBox(height: 8,),

              Text(model.description??'',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),),

            ],
          ),
        ),
      )
    );
  }
}

class fav_icon_check extends StatefulWidget {
  const fav_icon_check({
    super.key,
  });

  @override
  State<fav_icon_check> createState() => _fav_icon_checkState();
}

class _fav_icon_checkState extends State<fav_icon_check> {
  bool isClicked=true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            isClicked=!isClicked;
            // print("========================================");

          });
        },
        child:isClicked?Icon(Icons.favorite_border):Icon(Icons.favorite, color: Colors.red) ,

    );
  }
}
