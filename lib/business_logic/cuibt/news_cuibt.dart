//import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/business_logic/cuibt/news_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/bussiness/bussiness_screen.dart';
import 'package:news_app/screens/science/science_screen.dart';
import 'package:news_app/screens/settinngs/sittings_screen.dart';
import 'package:news_app/screens/sports/sport_screen.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

// https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

class NewsCuibt extends Cubit<NewsState> {
  NewsCuibt() : super(NewsInitailState());
  static NewsCuibt get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Budiness',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sport',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    // const BottomNavigationBarItem(
    //   icon: Icon(Icons.settings),
    //   label: 'Settings',
    // ),
  ];

  List<Widget> screens = [
    BuinessScreen(),
    SportScreen(),
    ScienceScreen(),
    // SittingsScreen(),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) getSport();
    if (index == 2) getScience();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinesLodingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      business = value?.data['articles'];
      //  print(business[0]['title']);
      emit(NewsGetBusinesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinesErrorState(error.toString()));
    });
  }

  List<dynamic> Sports = [];

  void getSport() {
    emit(NewsGetSportLodingState());

    if (Sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      }).then((value) {
        Sports = value?.data['articles'];
        //  print(business[0]['title']);
        emit(NewsGetSportSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLodingState());

    if (science.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      }).then((value) {
        science = value?.data['articles'];
        //  print(business[0]['title']);
        emit(NewsGetSportSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  bool isDark = false;

  void appTogleMode() {
    isDark = !isDark;
    emit(NewsGChangeModeState());
  }
}
