import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/Componants/Componants.dart';
import 'package:news_application/Cubits/NewsCubit/Cubits.dart';
import 'package:news_application/Cubits/NewsCubit/States.dart';

class Search extends StatelessWidget {
var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(title: Text('Search'),),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    onChange: (value){
                      NewsCubit.get(context).getSearchData(value);
                    },
                    validate: (String value){
                      if (value.isEmpty){
                        return'enter text here';
                      }
                      return null;
                    },
                    lable: 'search here',
                    Prefix: Icons.search),
              ),
              Expanded(child: buildArticleItem(context, list))
            ],),
        );
      },

    );
  }
}
