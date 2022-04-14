import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cuibt/news_cuibt.dart';
import 'package:news_app/business_logic/cuibt/news_state.dart';
import 'package:news_app/shared/components/conponents.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCuibt, NewsState>(
        builder: (context, state) {
          var list = NewsCuibt.get(context).Sports;

          return list.length > 0
              ? ListView.separated(
                  //  physics: BouncingScrollPhysics(),  // for rmove shadow
                  itemBuilder: (context, index) =>
                      buildArticaleItem(list[index], context),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: list.length)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
        listener: (context, state) {});
  }
}
