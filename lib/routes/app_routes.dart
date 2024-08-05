import 'package:art_selling_platform/features/art/view/art_reviews/art_reviews.dart';
import 'package:art_selling_platform/features/art/view/cart/cart.dart';
import 'package:art_selling_platform/features/art/view/checkout/checkout.dart';
import 'package:art_selling_platform/features/art/view/home/home.dart';
import 'package:art_selling_platform/features/art/view/orders/orders.dart';
import 'package:art_selling_platform/features/art/view/store/store.dart';
import 'package:art_selling_platform/features/art/view/wishList/wish_list.dart';
import 'package:art_selling_platform/features/authentication/views/login/login.dart';
import 'package:art_selling_platform/features/authentication/views/onBoarding/on_boarding.dart';
import 'package:art_selling_platform/features/authentication/views/password_config/forget_password.dart';
import 'package:art_selling_platform/features/authentication/views/signup/signup.dart';
import 'package:art_selling_platform/features/authentication/views/signup/verfiy_email.dart';
import 'package:art_selling_platform/features/personalization/views/addresses/addresses.dart';
import 'package:art_selling_platform/features/personalization/views/profile/profile.dart';
import 'package:art_selling_platform/features/personalization/views/settings/settings.dart';
import 'package:art_selling_platform/routes/routes.dart';
import 'package:get/get.dart';

class TAppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favoriates, page: () => const WishlistScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: TRoutes.productReviews, page: () => const ArtReviewsScreen()),
    GetPage(name: TRoutes.order, page: () => const OrdersScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckOutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const AddressesScreen()),
    GetPage(name: TRoutes.signUp, page: () => const SignUpScreen()),
    GetPage(name: TRoutes.verfiyEmail, page: () => const VerfiyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(
        name: TRoutes.forgetPassword, page: () => const ForgetpasswordScreen()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoarding()),
  ];
}
