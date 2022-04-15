abstract class NewsState {}

class NewsInitailState extends NewsState {}

class NewsBottomNavState extends NewsState {}

class NewsGetBusinesSuccessState extends NewsState {}

class NewsGetBusinesLodingState extends NewsState {}

class NewsGetBusinesErrorState extends NewsState {
  late final String error;
  NewsGetBusinesErrorState(this.error);
}

class NewsGetSportSuccessState extends NewsState {}

class NewsGetSportLodingState extends NewsState {}

class NewsGetSportErrorState extends NewsState {
  late final String error;
  NewsGetSportErrorState(this.error);
}

class NewsGetSearchSuccessState extends NewsState {}

class NewsGetSearchLodingState extends NewsState {}

class NewsGetSearchErrorState extends NewsState {
  late final String error;
  NewsGetSearchErrorState(this.error);
}

class NewsGetScienceSuccessState extends NewsState {}

class NewsGetScienceLodingState extends NewsState {}

class NewsGetScienceErrorState extends NewsState {
  late final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsGChangeModeState extends NewsState {}
