import 'package:bloc/bloc.dart';
import 'package:news_app/business_logic/cuibt/news_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCuibt extends Cubit<NewsState> {
  NewsCuibt() : super(NewsInitailState());
  static NewsCuibt get(context) => BlocProvider.of(context);
}
