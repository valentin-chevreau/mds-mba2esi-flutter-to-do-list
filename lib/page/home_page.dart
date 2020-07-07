import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/list/list_bloc.dart';
import 'package:to_do_list/bloc/list/list_state.dart';
import 'package:to_do_list/model/item_model.dart';
import 'package:to_do_list/page/home/widget/dialog_widget.dart';
import 'package:to_do_list/page/home/widget/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ItemModel> _items;

  bool newTask = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CHEVREAU V - MDS MBA2 ESI - TO DO LIST'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: BlocBuilder<ListBloc, ListState>(
                builder: (context, state) {
                  if (state is UninitializedListState) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nothing to display',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    );
                  } else if (state is HasTaskListState) {
                    List<ItemModel> items = state.items;

                    return ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          child: ItemWidget(
                            items[index],
                          ),
                        );
                      },
                    );
                  }
                  return Text('error');
                },
              ),
            ),
            Container(height: 16.0),
            newTask == false
                ? (Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      child: Container(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          newTask = true;
                        });
                      },
                    ),
                  ))
                : DialogWidget(),
          ],
        ),
      ),
    );
  }
}
