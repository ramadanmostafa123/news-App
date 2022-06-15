// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/AppCubit/cubit.dart';
import 'package:news_application/AppCubit/states.dart';
import 'package:news_application/cubit/cubit.dart';
import 'package:news_application/layouts/HomeLayout.dart';
import 'package:news_application/network/remote/dioHelper.dart';
import 'package:news_application/network/styles/BlocObserver.dart';
import 'package:news_application/network/styles/themeData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Bloc.observer = MyBlocObserver();
    DioHelper.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsCubit()
            ..getBuisness()
            ..getScience()
            ..getSports(),
        ),
        BlocProvider(
          create: (context) => AppCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: AppCubit.get(context).isDark ? darkMode : lightMode,
            home: HomeLayOut(),
          );
        },
      ),
    );
  }
}
