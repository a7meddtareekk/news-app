import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/Cubits/AppCubits/AppCubit.dart';
import 'package:news_application/Cubits/AppCubits/AppStates.dart';
import 'package:news_application/Cubits/NewsCubit/Cubits.dart';
import 'package:news_application/Shared/CachHelper.dart';
import 'package:news_application/Shared/DioHelper.dart';

import 'layout/HomeLayout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDarkMode=CacheHelper.getData(key: 'isDarkMode');
  runApp(MyApp(isDarkMode));
}

class MyApp extends StatelessWidget {
final bool? isDarkMode;
MyApp(this.isDarkMode);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=> NewsCubit()..getBusinessData()..getSportsData()..getScienceData()),
        BlocProvider(create:(context)=> AppCubit()..changeAppMode(fromShared: isDarkMode)),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                textTheme: TextTheme(bodyText1: TextStyle(
                    fontSize: 13,
                    color: Colors.black
                )),
                scaffoldBackgroundColor: Colors.white,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  selectedLabelStyle: TextStyle(color: Colors.deepOrange),
                  selectedItemColor: Colors.deepOrange,
                  showUnselectedLabels: true,
                  unselectedItemColor:Colors.grey ,
                ),
                appBarTheme:AppBarTheme(
                    elevation: 0,
                    color: Colors.white,
                    titleTextStyle: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.deepOrange),
                    actionsIconTheme: IconThemeData(color: Colors.deepOrange)
                )
            ),
            themeMode: AppCubit.get(context).isDarkMode? ThemeMode.dark:ThemeMode.light,
            darkTheme:ThemeData(
                scaffoldBackgroundColor: Colors.grey[900],
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.grey[900],
                  type: BottomNavigationBarType.fixed,
                  selectedLabelStyle: TextStyle(color: Colors.deepOrange),
                  selectedItemColor: Colors.deepOrange,
                  showUnselectedLabels: true,
                  unselectedItemColor:Colors.grey ,
                ),
                appBarTheme:AppBarTheme(
                    elevation: 0,
                    color: Colors.grey[900],
                    titleTextStyle: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.deepOrange),
                    actionsIconTheme: IconThemeData(color: Colors.deepOrange)
                ),
                textTheme: TextTheme(bodyText1: TextStyle(
                    fontSize: 13,
                    color: Colors.white
                ))
            ) ,
            home: HomeLayout(),
          );
        },
      ),
    );
  }
}


