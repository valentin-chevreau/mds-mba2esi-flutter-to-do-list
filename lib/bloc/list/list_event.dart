import 'package:to_do_list/model/item_model.dart';

class ListEvent {}

class AddTaskEvent extends ListEvent {
  ItemModel item;

  AddTaskEvent(this.item);
}

class DeleteTaskEvent extends ListEvent {
  ItemModel item;

  DeleteTaskEvent(this.item);
}

class ResetTaskList extends ListEvent {}
