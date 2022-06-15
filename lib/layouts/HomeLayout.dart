// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, equal_keys_in_map

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/AppCubit/cubit.dart';
import 'package:news_application/cubit/cubit.dart';
import 'package:news_application/cubit/cubit.dart';
import 'package:news_application/cubit/states.dart';
import 'package:news_application/models/search.dart';
import 'package:news_application/network/remote/dioHelper.dart';
import 'package:news_application/shared/components.dart';

class HomeLayOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'news app',
              style: TextStyle(fontSize: 10),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
                icon: Icon(Icons.search),
              ),
              SizedBox(
                width: 5,
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context).changeAppMode();
                },
                icon: Icon(
                  Icons.light_mode_outlined,
                ),
              ),
            ],
          ),
          body: NewsCubit.get(context)
              .screens[NewsCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: NewsCubit.get(context).currentIndex,
            onTap: (index) {
              NewsCubit.get(context).changeBottomNav(index);
            },
            items: NewsCubit.get(context).bottomItems,
          ),
        );
      },
    );
  }
}
