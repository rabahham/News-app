import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cuibt/news_cuibt.dart';
import 'package:news_app/business_logic/cuibt/news_state.dart';
import 'package:news_app/shared/components/conponents.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCuibt, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCuibt.get(context).search;
        return Scaffold(
          appBar: AppBar(
            title: Text('  '),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: textdField(
                  controller: SearchController,
                  hintText: 'Search',
                  onchange: (value) {
                    NewsCuibt.get(context).getSearch(value);
                    ;
                  },
                  prefixIconicon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                    //  physics: BouncingScrollPhysics(),  // for rmove shadow
                    itemBuilder: (context, index) =>
                        buildArticaleItem(list[index], context),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: list.length),
              )
            ],
          ),
        );
      },
    );
  }
}
