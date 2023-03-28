class Item{
   int id;
  final String? name;
  final String? category;
  final String? image;
   bool isFav;
  final double? price;
  int quantity=0;
  bool inCart=false;
  Item(
      {
        required this.id,

    this.name,
    this.category,
    this.image,
     required this.isFav,
     this.price,


});
}