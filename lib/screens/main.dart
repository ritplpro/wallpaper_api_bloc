import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_api/repositry/wallpaper_repositry.dart';
import 'package:wallpaper_api/screens/search-page.dart';

import 'package:wallpaper_api/wallpaper-bloc/wallpaper_bloc.dart';

import '../api/api_helper.dart';
import '../search-block/search_bloc.dart';
import 'home_page.dart';

void main() {
  runApp(MultiBlocProvider(providers:[
    BlocProvider(create:(BuildContext context)=>WallpaperBloc(wallpaperRepositry:WallpaperRepositry(apiHelper: ApiHelper()))),
    BlocProvider(create:(BuildContext context)=>SearchBloc(wallpaperRepositry: WallpaperRepositry(apiHelper: ApiHelper()))),
  ], child:const MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
