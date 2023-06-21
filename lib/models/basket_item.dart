class BasketItem {
  final int id;

  final String name;
  final int price;
  final int weight;
  int quantity;
  final String imageUrl;

  BasketItem({
    required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.quantity,
    required this.imageUrl,
  });
}
