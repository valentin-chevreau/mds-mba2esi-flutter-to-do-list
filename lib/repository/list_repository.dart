import 'package:to_do_list/model/item_model.dart';

class ListRepository {
  List<ItemModel> items = [];

  static final ListRepository _listRepository = ListRepository._internal();

  factory ListRepository() {
    return _listRepository;
  }

  ListRepository._internal();
}
