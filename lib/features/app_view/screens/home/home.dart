import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_insight_project/features/app_view/screens/search_screen/search_screen.dart';
import 'package:flutter_insight_project/features/search_result/view.dart';
import 'package:flutter_insight_project/features/widgets/news_item.dart';

import '../../../cubit/home_cubit.dart';
import '../news_detail/news_detail.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> gateogry = ["travel", "Technology", "Business", "Entertainment"];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..getHeadLineData(),
      child: Scaffold(
        backgroundColor: Color(0xffFAF9F9),
        appBar: AppBar(
          actionsPadding: EdgeInsetsGeometry.all(15),
          elevation: 0,
          forceMaterialTransparency: true,
          backgroundColor: Colors.white,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Icon(Icons.search),
              ),
            ),

            SizedBox(width: 10),

            Container(
              width: 35,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              child: Icon(Icons.notifications_none),
            ),
          ],
          leading: Icon(Icons.menu),
        ),

        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            print('================================$state');
            if (state is HomeLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is HomeFailure) {
              return Text(state.msg);
            }
            if (state is HomeSuccess) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      HeadTextHome(title: 'Breaking News', show: 'Show More'),

                      SizedBox(height: 10,),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          state.model[0].urlToImage ?? "",
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 200,
                              color: Colors.grey[300],
                              child: Icon(Icons.image, size: 50),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 10,),

                      // Expanded(
                      // flex: 1,

                          SizedBox(
                            height: 40,
                            // width: ,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: gateogry.length,
                              itemBuilder: (context, index) {
                                final isSelected = selectedIndex == index;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchResultScreen(query: gateogry[index])),);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                        color: isSelected ? Color(0xffFFA500) : Colors.white,
                                        border: isSelected ? null : Border.all(color: Colors.grey.shade300),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 8,
                                      ),
                                      child: Text(
                                        gateogry[index],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: isSelected?Colors.white:Colors.black
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),


                      // ),

                      SizedBox(height: 12,),
                      HeadTextHome(title: 'News For You', show: 'Show More'),

                      // SizedBox(height: 12,),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: state.model.length - 1,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NewsDetail(model: state.model[index + 1]),
                                ),
                              );
                            },
                            child: NewsItem(
                              newsTitle: state.model[index + 1].title ?? "",
                              newsDate: state.model[index + 1].publishedAt ?? "",
                              newsImage: state.model[index + 1].urlToImage ?? "",
                              newsDesc: state.model[index + 1].description ?? "",
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
            ;
            return SizedBox(child: Text("no state;"));
          },
        ),
      ),
    );
  }
}

class ChangeScreenBar extends StatelessWidget {
  const ChangeScreenBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(20),
        // color: Color(0xffFFA500)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
        child: Text(
          'Education',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

class HeadTextHome extends StatelessWidget {
  const HeadTextHome({super.key, required this.title, required this.show});
  final String title;
  final String show;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Text(
          show,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xff2C57F0),
          ),
        ),
      ],
    );
  }
}

