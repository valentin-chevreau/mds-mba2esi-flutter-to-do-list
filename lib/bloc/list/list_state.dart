import 'package:to_do_list/model/item_model.dart';

class ListState {}

class UninitializedListState extends ListState {}

class HasTaskListState extends ListState {
  final List<ItemModel> items;

  HasTaskListState(this.items);
}
