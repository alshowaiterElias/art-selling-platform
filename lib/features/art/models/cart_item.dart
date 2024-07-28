class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  String? artestName;

  CartItemModel({
    required this.productId,
    this.title = "",
    this.image,
    this.artestName,
    this.price = 0.0,
  });

  static CartItemModel empty() => CartItemModel(productId: "");

  Map<String, dynamic> toJson() {
    return {
      "ProductId": productId,
      "Image": image,
      "ArtestName": artestName,
      "Price": price,
      "Title": title,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json["ProductId"],
      artestName: json["ArtestName"],
      image: json["Image"],
      price: json["Price"] as double,
      title: json["Title"],
    );
  }
}
