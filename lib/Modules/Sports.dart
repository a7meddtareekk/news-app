import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Componants/Componants.dart';
import '../Cubits/NewsCubit/Cubits.dart';
import '../Cubits/NewsCubit/States.dart';

class Sports extends StatelessWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var list = NewsCubit.get(context).sports;

        return ConditionalBuilder(
            condition: state is! NewsSportsLoadingStates,
            builder:(context)=> ListView.separated(
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index)=> buildArticleItem(context,list[index])  ,
              separatorBuilder: (BuildContext context, int index)=> myDivider(),

            ),
            fallback: (context)=>Center(child: CircularProgressIndicator(),)); },

    );
  }
}
