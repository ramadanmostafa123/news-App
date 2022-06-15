// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/cubit/states.dart';
import 'package:news_application/models/BuisnessScreen..dart';
import 'package:news_application/models/ScienceScreen.dart';
import 'package:news_application/models/SportsScreen.dart';
import 'package:news_application/network/remote/dioHelper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  int currentIndex = 0;
  static NewsCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> bottomItems = [
    // ignore: prefer_const_constructors
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center_outlined), label: 'Buisness'),
    BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: 'Sceince'),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_bar_outlined),
      label: 'Sports',
    ),
  ];

  List<Widget> screens = [
    BuisnessScreen(),
    ScienceScreen(),
    SportScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;

    emit(NewschangeBottomNav());
  }

  List<dynamic> buisness = [];
  void getBuisness() {
    emit(GetBuisnessloadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      emit(GetBuisnessSuccessState());
      // print(value.data['articles'][0]['title']);
      buisness = value.data['articles'];
      print(buisness[1]['title']);
    }).catchError((error) {
      print(error.toString());
      emit(GetBuisnessErrorState(error.toString()));
    });
  }

  /*List<dynamic> science = [];
  void getSceince() {
    emit(GetScienceloadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      emit(GetScienceSuccessState());
      science = value.data['article'];
      print(science[1]['title']);
      print('hhhhhhhhhhhhhhhhhhhhhhh');
    }).catchError((error) {
      emit(GetScienceErrorState(error.toString()));
      print(error.toString());
    });
  }*/

  List<dynamic> science = [];
  void getScience() {
    emit(GetBuisnessloadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      emit(GetBuisnessSuccessState());
      // print(value.data['articles'][0]['title']);
      science = value.data['articles'];
      print(science[1]['title']);
    }).catchError((error) {
      print(error.toString());
      emit(GetBuisnessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(GetSportsloadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      emit(GetSportsSuccessState());
      sports = value.data['articles'];
    }).catchError((error) {
      emit(GetSportsErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> search = [];
  void getSearch(value) {
    emit(GetSearchloadingState());
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      emit(GetSearchSuccessState());
      search = value.data['articles'];
    }).catchError((error) {
      emit(GetSearchErrorState(error.toString()));
      print(error.toString());
    });
  }
}
