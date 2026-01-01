part of '../../home_cubit.dart';

class HomeState {}
class HomeInitial extends HomeState{}
class HomeLoading extends HomeState{}
class HomeSuccess extends HomeState{
  final List<ArticleModel> model;
  HomeSuccess(this.model);
}
class HomeFailure extends HomeState{
  final String msg;
  HomeFailure(this.msg) {
    // TODO: implement HomeFailure
     Column(
       mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(msg,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.cyan,
            shadows:[
              Shadow(
                blurRadius: 10.0,
                color: Colors.blueAccent,
                offset: Offset(5.0, 5.0),
              ),
            ],
          ),)
      ],
    );
  }
}
