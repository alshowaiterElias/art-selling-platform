import 'package:art_selling_platform/features/art/models/cart_item.dart';
import 'package:art_selling_platform/features/art/models/product_model.dart';
import 'package:art_selling_platform/utils/loaders/loaders.dart';
import 'package:art_selling_platform/utils/local_storage/localStorage.dart';
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
    if (productQuantityInCart.value < 1) {
      TLoaders.customToast(message: "اختر كمية");
      return;
    } else {
      if (product.isFeatured == false) {
        TLoaders.warningSnackBar(title: "يا ساتر", message: "المنتج غير متوفر");
        return;
      }
    }

    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    int index =
        cartItems.indexWhere((e) => e.productId == selectedCartItem.productId);

    if (index >= 0) {
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    TLoaders.customToast(message: "تمت اصافة اللوحة");
  }

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    final price = product.salePrice > 0.0 ? product.salePrice : product.price;
    return CartItemModel(
        productId: product.id,
        quantity: quantity,
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
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItem += item.quantity;
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
          (previousValue, element) => previousValue + element.quantity,
        );
    return foundItem;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((e) => e.productId == item.productId);
    if (index >= 0) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((e) => e.productId == item.productId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
        title: "Remove Item",
        middleText: "Are you sure you want to remove this item?",
        onConfirm: () {
          cartItems.removeAt(index);
          updateCart();
          TLoaders.customToast(message: "Product removed from cart");
          Get.back();
        },
        onCancel: () => Get.back());
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    productQuantityInCart.value = getProductQuantityInCart(product.id);
  }

  int findTotalPrice() {
    return (totalCartPrice.value + shippingCost).toInt();
  }
}
