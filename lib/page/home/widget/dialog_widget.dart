import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/list/list_bloc.dart';
import 'package:to_do_list/bloc/list/list_event.dart';
import 'package:to_do_list/model/item_model.dart';

class DialogWidget extends StatefulWidget {
  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  final title = TextEditingController();
  final content = TextEditingController();

  bool newTask = true;

  @override
  void dispose() {
    title.dispose();
    content.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return newTask == true
        ? Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      labelText: 'Titre de la tâche',
                    ),
                    controller: title,
                  ),
                  Container(
                    height: 16.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      labelText: 'Contenu de la tâche',
                    ),
                    controller: content,
                  ),
                  Container(
                    height: 16.0,
                  ),
                  RaisedButton(
                    color: Colors.green,
                    child: Container(
                      child: Text(
                        'Ajouter la tâche',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        newTask = false;
                      });
                      BlocProvider.of<ListBloc>(context).add(
                          AddTaskEvent(ItemModel(title.text, content.text)));
                    },
                  ),
                ],
              ),
            ),
          )
        : Container();
  }
}
