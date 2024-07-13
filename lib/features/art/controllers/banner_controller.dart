import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

//variables
  final Rx<int> carouselCurrentIndex = 0.obs;
  // final RxList<BannerModel> banners = <BannerModel>[].obs;
  final List<String> banners = [
    TImageStrings.lightLogo,
    TImageStrings.lightLogo,
  ].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    // fetchBanners();
    super.onInit();
  }

//update slider dots
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

//fetch banners
  // Future<void> fetchBanners() async {
  //   try {
  //     isLoading.value = true;
  //     final bannerRepo = Get.put(BannerRepo());
  //     final banners = await bannerRepo.fetchBanners();

  //     this.banners.assignAll(banners);
  //   } catch (e) {
  //     TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
