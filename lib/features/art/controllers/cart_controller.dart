import 'package:art_selling_platform/features/art/models/cart_item.dart';
import 'package:art_selling_platform/features/art/models/product_model.dart';
import 'package:art_selling_platform/utils/loaders/loaders.dart';
import 'package:art_selling_platform/utils/local_storage/local_storage.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  //variable
  RxInt noOfCartItem = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  int shippingCost = 1000;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  CartController() {
    loadCartItem();
  }

  //add items into cart
  void addToCart(ProductModel product) {
    if (product.isFeatured == false) {
      TLoaders.warningSnackBar(title: "يا ساتر", message: "المنتج غير متوفر");
      return;
    }

    final selectedCartItem = convertToCartItem(product);

    cartItems.add(selectedCartItem);

    updateCart();
    TLoaders.customToast(message: "تمت اصافة اللوحة");
  }

  CartItemModel convertToCartItem(ProductModel product) {
    final price = product.salePrice > 0.0 ? product.salePrice : product.price;
    return CartItemModel(
        productId: product.id,
        artestName: product.artest != null ? product.artest!.name : "",
        image: product.thumbNail,
        price: price,
        title: product.title);
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItem = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price);
      calculatedNoOfItem += 1;
    }
    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItem.value = calculatedNoOfItem;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((e) => e.toJson()).toList();
    TLocalStorage.instance().saveData("cartItems", cartItemStrings);
  }

  void loadCartItem() {
    final cartItemStrings =
        TLocalStorage.instance().readData<List<dynamic>>("cartItems");
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList());
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems.where((e) => e.productId == productId).fold(
          0,
          (previousValue, element) => previousValue + 1,
        );
    return foundItem;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  void addOneToCart(CartItemModel item) {
    // int index = cartItems.indexWhere((e) => e.productId == item.productId);
    cartItems.add(item);

    updateCart();
    TLoaders.customToast(message: "تمت اضافة اللوحة الى قائمة المشتريات");
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((e) => e.productId == item.productId);
    removeFromCartDialog(index);
    updateCart();
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
        title: "حذف العنصر",
        middleText: "هل انت متاكد من عملية الحذف؟",
        onConfirm: () {
          cartItems.removeAt(index);
          updateCart();
          TLoaders.customToast(message: "تمت إزالة المنتج");
          Get.back();
        },
        onCancel: () => () => Get.back());
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    productQuantityInCart.value = getProductQuantityInCart(product.id);
  }

  int findTotalPrice() {
    return (totalCartPrice.value + shippingCost).toInt();
  }
}
