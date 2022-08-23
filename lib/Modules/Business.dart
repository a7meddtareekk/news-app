import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/Componants/Componants.dart';
import 'package:news_application/Cubits/NewsCubit/Cubits.dart';
import 'package:news_application/Cubits/NewsCubit/States.dart';

class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var list = NewsCubit.get(context).business;

        return ConditionalBuilder(
          condition: list.length>0,
          builder:(context)=> ListView.separated(
            physics: BouncingScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index)=> buildArticleItem(context,list[index])  ,
            separatorBuilder: (BuildContext context, int index)=> myDivider(),

          ),
          fallback: (context)=>Center(child: CircularProgressIndicator(),)); },

    );
  }
}
