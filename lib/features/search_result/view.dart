import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_insight_project/features/widgets/news_item.dart';
import '../app_view/screens/news_detail/news_detail.dart';
import '../cubit/home_cubit.dart';


class SearchResultScreen extends StatelessWidget {
  SearchResultScreen({super.key,required this.query});
final String query;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HomeCubit()..searchEndPoint(query: query),
        child: Scaffold(
          backgroundColor: Color(0xffFAF9F9),
          appBar: AppBar(
            actionsPadding: EdgeInsetsGeometry.all(15),
            elevation: 0,

            centerTitle: true,
            forceMaterialTransparency: true,
            backgroundColor: Colors.white,

            title: Text("Search results",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),),
            leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(context);

                },
                child: Icon(Icons.arrow_back_ios_new)),
          ),

          body:
          BlocBuilder<HomeCubit,HomeState>(
              builder:(context, state) {
                print('================================$state');
                if (state is HomeLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is HomeFailure) {
                  return Text(state.msg);
                }
                if (state is HomeSuccess) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [


                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: state.model.length - 1,
                            itemBuilder:
                                (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsDetail(model: state.model[index+1],)));

                                },
                                child: NewsItem(
                                    newsTitle: state.model[index + 1].title ?? "",
                                    newsDate: state.model[index + 1].publishedAt ??
                                        "",
                                    newsImage: state.model[index + 1].urlToImage ??
                                        "",
                                    newsDesc: state.model[index + 1].description ?? ""
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return SizedBox(child: Text("no state;"),);
              }

          ),


        ));
  }
}

class ChangeScreenBar extends StatelessWidget {
  const ChangeScreenBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(20),
          // color: Color(0xffFFA500)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 7),
          child: Text('Education',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),),
        )
    );
  }
}

class HeadTextHome extends StatelessWidget {
  const HeadTextHome({
    super.key,
    required this.title,
    required this.show
  });
  final String title;
  final String show;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600
          ),),
        Text(show,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xff2C57F0)
          ),)
      ],
    );
  }
}
