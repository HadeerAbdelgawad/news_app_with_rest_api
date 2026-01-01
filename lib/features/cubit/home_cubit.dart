// import 'package:dio/dio.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_insight_project/model/article_model.dart';
// import 'home_state.dart';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/article_model.dart';
part 'features/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit(): super(HomeInitial());

  final dio=Dio();

  Future<void>getHeadLineData()async{//Future-> to not be dynamic

    try{
      emit(HomeLoading());
      final Response response= await dio.get(//send base url
        'https://newsapi.org/v2/top-headlines',
            queryParameters: {
              'country':'us',
              'apiKey':'3ea2133fedd94c3c82d52405f3ebc895'
        },
      );
      //check response
      final articles= response.data['articles'] as List;//articles hold list {}
      print('articles $articles');
      final data = articles.map((art)=> ArticleModel.fromJson(art),).toList();

      print('data $data');

      emit(HomeSuccess(data));


    }on DioException catch(e){
      print(e.message??"There Is an Error");
      emit(HomeFailure(e.message??""));
    }catch(e){
      print(e.toString()??"There Is an Error");
      emit(HomeFailure(e.toString()??""));
    }

  }

  Future<void>searchEndPoint({required String query})async{//Future-> to not be dynamic

    try{
      emit(HomeLoading());
      final Response response= await dio.get(//send base url
        'https://newsapi.org/v2/everything',
        queryParameters: {
          'q':query,
          'apiKey':'3ea2133fedd94c3c82d52405f3ebc895'
        },
      );
      //check response
      final articles= response.data['articles'] as List;//articles hold list {}
      print('search $articles');
      final data = articles.map((art)=> ArticleModel.fromJson(art),).toList();

      print('searchData $data');

      emit(HomeSuccess(data));


    }on DioException catch(e){
      print(e.message??"There Is an Error");
      emit(HomeFailure(e.message??""));
    }catch(e){
      print(e.toString()??"There Is an Error");
      emit(HomeFailure(e.toString()??""));
    }

  }

}