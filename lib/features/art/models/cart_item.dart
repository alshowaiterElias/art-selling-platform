class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String? artestName;

  CartItemModel({
    required this.productId,
    required this.quantity,
    this.title = "",
    this.image,
    this.artestName,
    this.price = 0.0,
  });

  static CartItemModel empty() => CartItemModel(productId: "", quantity: 0);

  Map<String, dynamic> toJson() {
    return {
      "ProductId": productId,
      "Quantity": quantity,
      "Image": image,
      "ArtestName": artestName,
      "Price": price,
      "Title": title,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json["ProductId"],
      quantity: json["Quantity"],
      artestName: json["ArtestName"],
      image: json["Image"],
      price: json["Price"] as double,
      title: json["Title"],
    );
  }
}
