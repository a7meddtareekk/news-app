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

        return  ArticleBuilder(list,context);
        },
    );
  }
}
