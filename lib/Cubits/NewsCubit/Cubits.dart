import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/Cubits/NewsCubit/States.dart';
import 'package:news_application/Modules/Business.dart';
import 'package:news_application/Modules/Science.dart';
import 'package:news_application/Modules/Setting.dart';
import 'package:news_application/Modules/Sports.dart';
import 'package:news_application/Shared/DioHelper.dart';

import '../../Model/Model.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(NewsInitialStates());
  static NewsCubit get(context)=>BlocProvider.of(context);

int currentIndex=0;
void changeBottomNav(int index){
  currentIndex=index;
  if(index==1)
    getSportsData();
  if(index==2)
    getScienceData();
  emit(NewsChangeBottomNavStates());}

  List<Widget>screens=[
    Business(),
    Sports(),
    Science(),
    Setting(),
  ];
List<String>title=[
  'Business',
  'Sports',
  'Science',
  'Settings',
];


List<NewsModel>newsBusinessModel=[];
List<dynamic>business=[];
void getBusinessData(){
  emit(NewsBusinessLoadingStates());

  if(business.length==0){
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': 'd7011cf7300b42be9cbefccc00a06ac1',
        }).then((value) {
      business=value.data['articles'];
      print(business.toString());
      emit(NewsBusinessSuccessStates());
    }).catchError((onError){
      emit(NewsBusinessErrorStates());
    });
  }
  else{
    emit(NewsBusinessSuccessStates());
  }

}

List<NewsModel>newsSportsModel=[];
List<dynamic>sports=[];
void getSportsData(){
  emit(NewsSportsLoadingStates());

  if(sports.length==0){

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': 'd7011cf7300b42be9cbefccc00a06ac1',
        }).then((value) {
      sports=value.data['articles'];
      emit(NewsSportsSuccessStates());
    }).catchError((onError){
      emit(NewsSportsErrorStates());
    });
  }else{NewsSportsSuccessStates();}
}

List<NewsModel>newsScienceModel=[];
List<dynamic>science=[];
void getScienceData(){
  emit(NewsScienceLoadingStates());

  if(science.length==0){
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': 'd7011cf7300b42be9cbefccc00a06ac1',
        }).then((value) {
      science=value.data['articles'];
      emit(NewsScienceSuccessStates());
    }).catchError((onError){
      emit(NewsScienceErrorStates());
    });

  }else{emit(NewsScienceSuccessStates());}


}


  List<dynamic> search = [];
void getSearchData(value){
  
  search=[];
  emit(NewsSearchLoadingStates());
  DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '${value}',

        'apiKey': 'd7011cf7300b42be9cbefccc00a06ac1',
      }).then((value) {
    search=value.data['articles'];
    emit(NewsSearchSuccessStates());
  }).catchError((onError){
    emit(NewsSearchErrorStates(onError.toString()));
  });


}
// https://newsapi.org/v2/everything?q=tesla&apiKey=d7011cf7300b42be9cbefccc00a06ac1

}