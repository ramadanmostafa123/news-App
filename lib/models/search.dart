// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/cubit/cubit.dart';
import 'package:news_application/cubit/states.dart';
import 'package:news_application/shared/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            title: Text(''),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  label: 'saerch',
                  onChange: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  prefix: Icons.search,
                ),
              ),
              // ConditionalBuilder(
              //   condition: list.isNotEmpty,
              //   fallback: (context) =>
              //       Center(child: CircularProgressIndicator()),
              //   builder: (context) => ListView.separated(
              //       physics: BouncingScrollPhysics(),
              //       itemBuilder: (context, index) => Expanded(
              //           flex: 2, child: buisnessBuilder(list, context)),
              //       separatorBuilder: (context, index) => Container(
              //             height: 1,
              //             color: Colors.grey,
              //           ),
              //       itemCount: list.length),
              // ),

              Expanded(
                child: articleBuilder(
                  list,
                  context,
                  isSearch: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
