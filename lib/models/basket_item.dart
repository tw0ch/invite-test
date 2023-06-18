class BasketItem {
  final int id; // you can also use id = null to auto increment

  final String name;
  final int price;
  final int weight;
  final int quantity;
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
