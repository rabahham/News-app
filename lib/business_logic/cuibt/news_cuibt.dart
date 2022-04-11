//import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/business_logic/cuibt/news_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/bussiness/bussiness_screen.dart';
import 'package:news_app/screens/science/science_screen.dart';
import 'package:news_app/screens/settinngs/sittings_screen.dart';
import 'package:news_app/screens/sports/sport_screen.dart';

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
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  List<Widget> screens = [
    BuinessScreen(),
    SportScreen(),
    ScienceScreen(),
    SittingsScreen(),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }
}
