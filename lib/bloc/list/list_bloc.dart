import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/list/list_event.dart';
import 'package:to_do_list/bloc/list/list_state.dart';
import 'package:to_do_list/repository/list_repository.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc(ListState initialState) : super(initialState);

  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    ListRepository listRepository = ListRepository();

    if (event is AddTaskEvent) {
      listRepository.items.add(event.item);
      yield HasTaskListState(listRepository.items);
    } else if (event is DeleteTaskEvent) {
      listRepository.items.remove(event.item);
      yield HasTaskListState(listRepository.items);
    } else if (event is ResetTaskList) {
      yield UninitializedListState();
    }
  }
}
