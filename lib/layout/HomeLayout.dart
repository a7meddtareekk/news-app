import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/Componants/Componants.dart';
import 'package:news_application/Cubits/AppCubits/AppCubit.dart';
import 'package:news_application/Cubits/NewsCubit/Cubits.dart';
import 'package:news_application/Cubits/NewsCubit/States.dart';
import 'package:news_application/Modules/Search.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var newsCubit = NewsCubit.get(context);

        return  Scaffold(
          appBar: AppBar(
            title: Text(newsCubit.title[newsCubit.currentIndex],),
            actions: [
              IconButton(onPressed: (){navigateTo(context, Search());}, icon: Icon(Icons.search)),
              IconButton(onPressed: (){
                AppCubit.get(context).changeAppMode();
              }, icon: Icon(Icons.brightness_4_outlined)),

            ],),
          body: newsCubit.screens[newsCubit.currentIndex],


          bottomNavigationBar: BottomNavigationBar(
              currentIndex:newsCubit.currentIndex ,
              onTap: (index){
                newsCubit.changeBottomNav(index);
              },

              items:[
                BottomNavigationBarItem(icon: Icon(Icons.business,),label: 'Business',),
                BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
                BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
                BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Setting'),
              ] ),
        );
      },

    );
  }
}
