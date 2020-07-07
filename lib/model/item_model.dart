class ItemModel {
  String title;
  String content;

  DateTime date = DateTime.now();

  ItemModel(this.title, this.content);

  @override
  String toString() {
    return 'ItemModel{name: $title}';
  }
}
