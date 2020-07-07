import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/list/list_bloc.dart';
import 'package:to_do_list/bloc/list/list_state.dart';
import 'package:to_do_list/page/home_page.dart';

void main() {
  runApp(ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ListBloc(UninitializedListState()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
