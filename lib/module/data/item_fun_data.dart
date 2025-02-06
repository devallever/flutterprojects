class ItemFunData {
  String title = "";
  String desc = "";
  void Function(ItemFunData data) itemClick;

  ItemFunData({
    required this.title ,
    required this.desc,
    required this.itemClick
  });
}
